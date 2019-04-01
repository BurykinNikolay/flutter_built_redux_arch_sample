import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CameraExampleHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Function() next;
  CameraExampleHome(this.cameras, this.next);
  @override
  _CameraExampleHomeState createState() {
    return _CameraExampleHomeState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraExampleHomeState extends State<CameraExampleHome> {
  CameraController controller;
  String imagePath;
  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    onNewCameraSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: _cameraPreviewWidget(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _captureControlRowWidget(),
          ],
        ));
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Камеры у вашего устройства нет',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    Widget _iconButton = Container();
    if (controller.value.isInitialized && !controller.value.isRecordingVideo) {
      _iconButton = IconButton(
        iconSize: 45,
        icon: const Icon(
          Icons.fiber_manual_record,
        ),
        color: Colors.white,
        onPressed: controller != null &&
                controller.value.isInitialized &&
                !controller.value.isRecordingVideo
            ? onVideoRecordButtonPressed
            : null,
      );
    }
    if (controller.value.isRecordingVideo) {
      _iconButton = IconButton(
        iconSize: 45,
        icon: const Icon(
          Icons.stop,
        ),
        color: Colors.red,
        onPressed: controller != null &&
                controller.value.isInitialized &&
                controller.value.isRecordingVideo
            ? onStopButtonPressed
            : null,
      );
    }

    return Center(child: _iconButton);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected() async {
    CameraDescription cameraDescription;
    if (widget.cameras.length > 1) {
      cameraDescription = widget.cameras[1];
    }

    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onVideoRecordButtonPressed() {
    setState(() {
      startVideoRecording().then((String filePath) {
        if (mounted) setState(() {});
        if (filePath != null) showInSnackBar('Saving video to $filePath');
      });
    });
  }

  void onStopButtonPressed() {
    setState(() {
      stopVideoRecording().then((_) {
        if (mounted) setState(() {});
        showInSnackBar('Video recorded to: $videoPath');
        widget.next();
      });
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getTemporaryDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    await _startVideoPlayer();
  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imagePath = null;
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
