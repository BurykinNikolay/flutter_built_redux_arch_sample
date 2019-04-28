import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'camera_model.dart';
import 'camera_view.dart';

class CameraPresenter extends StatelessWidget {
  final CameraModel model;
  final AppActions actions;
  final Function() next;

  CameraPresenter({Key key, this.model, this.actions, this.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraView(
      model: model,
      presenter: this,
      next: next,
    );
  }

  void setCurrentFilePath(String path) {
    actions.camera.setCurrentFilePath(path);
  }

  Future start() async {
    if (!model.controller.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getTemporaryDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (model.controller.value.isRecordingVideo) {
      return null;
    }
    try {
      await model.controller.startVideoRecording(filePath);
    } catch (e) {
      return null;
    }
    actions.camera.start(filePath);
  }

  Future stop() async {
    if (!model.controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await model.controller.stopVideoRecording();
    } catch (e) {
      return null;
    }
    actions.camera.stop();
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
}
