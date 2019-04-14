import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CameraExampleHome extends StatefulWidget {
  final CameraController controller;

  final Function(String videoPath) next;
  CameraExampleHome({this.controller, this.next});
  @override
  _CameraExampleHomeState createState() {
    return _CameraExampleHomeState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraExampleHomeState extends State<CameraExampleHome> {
  String imagePath;
  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _cameraPreviewWidget(),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (widget.controller == null || !widget.controller.value.isInitialized) {
      return Center(
          child: Text(
        'Камеры у вашего устройства нет',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10.0,
          fontWeight: FontWeight.w900,
        ),
      ));
    } else {
      return Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 6, top: 40, right: 6),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: AspectRatio(
                        aspectRatio: widget.controller.value.aspectRatio,
                        child: CameraPreview(widget.controller),
                      ))),
              Expanded(
                  child: Container(
                color: Colors.black,
                child: _captureControlRowWidget(),
              ))
            ],
          ));
    }
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    Widget _iconButton = Container();
    if (widget.controller.value.isInitialized &&
        !widget.controller.value.isRecordingVideo) {
      _iconButton = GestureDetector(
        onTap: widget.controller != null &&
                widget.controller.value.isInitialized &&
                !widget.controller.value.isRecordingVideo
            ? onVideoRecordButtonPressed
            : null,
        child: Container(
          height: 70,
          width: 70,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(2),
            height: 43,
            width: 43,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Container(
              margin: EdgeInsets.all(3),
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      );
    }
    if (widget.controller.value.isRecordingVideo) {
      _iconButton = IconButton(
        padding: EdgeInsets.all(0),
        iconSize: 45,
        icon: const Icon(
          Icons.stop,
        ),
        color: Colors.red,
        onPressed: widget.controller != null &&
                widget.controller.value.isInitialized &&
                widget.controller.value.isRecordingVideo
            ? onStopButtonPressed
            : null,
      );
    }

    return Center(child: _iconButton);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void onVideoRecordButtonPressed() {
    setState(() {
      startVideoRecording().then((String filePath) {
        if (mounted) setState(() {});
        if (filePath != null) print('Saving video to $filePath');
      });
    });
  }

  void onStopButtonPressed() {
    setState(() {
      stopVideoRecording().then((_) {
        if (mounted) setState(() {});
        print('Video recorded to: $videoPath');
        widget.next(videoPath);
      });
    });
  }

  Future<String> startVideoRecording() async {
    if (!widget.controller.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getTemporaryDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (widget.controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await widget.controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!widget.controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await widget.controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    // await _startVideoPlayer();
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
    print('Error: ${e.code}\n${e.description}');
  }
}
