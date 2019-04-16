import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';
import 'package:video_player/video_player.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/presentation/components/components.dart';

import 'question_carusel_view.dart';
import 'question_carusel_model.dart';
import 'video_util.dart';

class QuestionCaruselPresenter extends StatelessWidget {
  final QuestionCaruselModel model;
  final AppActions actions;

  QuestionCaruselPresenter({Key key, this.model, this.actions})
      : super(key: key);

  get videoController => null;

  @override
  Widget build(BuildContext context) {
    return QuestionCaruselView(
      model: model,
      presenter: this,
    );
  }

  void encodeVideo(BuildContext context, List<String> results) {
    startProgress(context);
    VideoUtil().encodeVideo(results).then((outputFilePath) {
      Navigator.of(context).pop();
      if (outputFilePath == "error") {
      } else {
        setPath(outputFilePath);
      }
    });
  }

  Future setPath(String outputFilePath) async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(outputFilePath));
    await vcontroller.initialize();

    await vcontroller.setLooping(false);

    await vcontroller.play();
    actions.carusel.setPath(outputFilePath);
    actions.carusel.setPlayer(vcontroller);
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
}
