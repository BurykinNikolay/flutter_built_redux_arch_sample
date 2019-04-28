import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';
import 'package:video_player/video_player.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/presentation/components/components.dart';

import 'interview_view.dart';
import 'interview_model.dart';
import 'utilits/video_util.dart';

class InterviewPresenter extends StatelessWidget {
  final InterviewModel model;
  final AppActions actions;

  InterviewPresenter({Key key, this.model, this.actions}) : super(key: key);

  get videoController => null;

  @override
  Widget build(BuildContext context) {
    return InterviewView(
      model: model,
      presenter: this,
    );
  }

  void encodeVideo(BuildContext context, int index, String videoPath) {
    addResult(index - 1, videoPath);

    final newResults = model.results;
    newResults[index] = videoPath;

    startProgress(context);
    VideoUtil().encodeVideo(newResults).then((outputFilePath) {
      Navigator.of(context).pop();
      if (outputFilePath == "error") {
      } else {
        setPath(outputFilePath);
      }
    });
  }

  void setScreenshotPath(String path) {
    print("make a action");
  }

  Future setPath(String outputFilePath) async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(outputFilePath));
    await vcontroller.initialize();

    await vcontroller.setLooping(false);

    await vcontroller.play();
    actions.interview.setPath(outputFilePath);
    actions.interview.setPlayer(vcontroller);
  }

  void startProgress(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return ProgressBarShadow();
        });
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 150),
    );
  }

  void shareFile() async {
    var file = File(model.path);
    ShareExtend.share(file.path, "file");
    actions.routeBack();
  }

  void setCameraController(CameraController controller) {
    actions.camera.setCameraController(controller);
  }

  Future stop() async {
    if (!model.cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      await model.cameraController.stopVideoRecording();
    } catch (e) {
      return null;
    }
    actions.camera.stop();
  }

  void addResult(int index, String result) {
    final newResults = model.results;
    newResults[index] = result;
    actions.interview.addResult(newResults);
  }

  void repeat() {
    actions.interview.repeat();
  }
}
