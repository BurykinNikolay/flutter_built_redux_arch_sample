import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'camera_model.dart';
import 'camera_presenter.dart';

class CameraView extends StatefulWidget {
  final CameraModel model;
  final CameraPresenter presenter;
  final Function() next;
  CameraView({this.model, this.presenter, this.next});
  @override
  _CameraViewState createState() {
    return _CameraViewState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraViewState extends State<CameraView> {
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cameraPreviewWidget(),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (widget.model.controller == null ||
        !widget.model.controller.value.isInitialized) {
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
                        aspectRatio: widget.model.controller.value.aspectRatio,
                        child: CameraPreview(widget.model.controller),
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
    if (widget.model.controller.value.isInitialized &&
        !widget.model.controller.value.isRecordingVideo) {
      _iconButton = GestureDetector(
        onTap: widget.model.controller != null &&
                widget.model.controller.value.isInitialized &&
                !widget.model.controller.value.isRecordingVideo
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
    if (widget.model.controller.value.isRecordingVideo) {
      _iconButton = IconButton(
        padding: EdgeInsets.all(0),
        iconSize: 45,
        icon: const Icon(
          Icons.stop,
        ),
        color: Colors.red,
        onPressed: widget.model.controller != null &&
                widget.model.controller.value.isInitialized &&
                widget.model.controller.value.isRecordingVideo
            ? onStopButtonPressed
            : null,
      );
    }

    return Center(child: _iconButton);
  }

  void onVideoRecordButtonPressed() {
    setState(() {
      widget.presenter.start();
    });
  }

  void onStopButtonPressed() {
    setState(() {
      widget.presenter.stop();
      widget.next();
    });
  }
}
