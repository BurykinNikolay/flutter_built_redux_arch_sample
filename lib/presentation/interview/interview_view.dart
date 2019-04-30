import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:yops_interview/presentation/camera/camera.dart';

import 'components/video_player_preview.dart';
import 'interview_presenter.dart';
import 'interview_model.dart';

class InterviewView extends StatefulWidget {
  final InterviewModel model;
  final InterviewPresenter presenter;
  InterviewView({this.model, this.presenter});
  @override
  _InterviewViewState createState() => _InterviewViewState();
}

class _InterviewViewState extends State<InterviewView> {
  Widget camera;
  List<String> assets = [];
  List<int> indexList = [];

  var scr = new GlobalKey();
  CarouselSlider carusel;

  @override
  void initState() {
    super.initState();
    initCamera();
    _delayedNext(0);
  }

  Future initCamera() async {
    if (widget.model.cameraController == null) {
      var cameras = widget.model.cameras;
      print(cameras.length);
      CameraDescription cameraDescription;
      if (cameras.length > 1) {
        cameraDescription = cameras[1];
      }

      CameraController cameraController;
      if (cameraDescription != null) {
        cameraController =
            CameraController(cameraDescription, ResolutionPreset.high);
      }
      print("set new cameraController");
      camera = Camera(
        next: _next,
      );
      await cameraController.initialize();
      widget.presenter.setCameraController(cameraController);
    } else {
      print("cameraController !=null");
      camera = Camera(
        next: _next,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: _slider(context, MediaQuery.of(context).size.height));
  }

  Widget _slider(BuildContext context, double height) {
    List<String> questions = widget.model.questions;
    List<Widget> questionsWithCamera = [];
    int index = 0;
    for (String question in questions) {
      List<List<Color>> colors = [
        [
          Color(0xFFE6693A),
          Color(0xFFE7693F),
          Color(0xFFE9694F),
          Color(0xFFE96B60),
        ],
        [
          Color(0xFF4CABD6),
          Color(0xFF56BFDF),
          Color(0xFF65D9E8),
          Color(0xFF6AE1EC),
        ]
      ];
      final _random = new Random();
      var values = colors.toList();
      var colorScheme = values[_random.nextInt(values.length)];
      final questionItem = _question(question, colorScheme);
      indexList.add(index);
      questionsWithCamera.add(questionItem);
      index += 1;
      questionsWithCamera.add(camera);
      index += 1;
    }
    questionsWithCamera.add(_last());

    carusel = CarouselSlider(
      height: height,
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      onPageChanged: (int index) {
        _pageChanged(index, context);
      },
      items: questionsWithCamera.map((widget) {
        return Builder(
          builder: (BuildContext context) {
            return widget;
          },
        );
      }).toList(),
    );

    return carusel;
  }

  Widget _last() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 6, top: 50, right: 6, bottom: 70),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: widget?.model?.player != null
              ? Container(
                  child: VideoPlayerPreview(
                  player: widget.model.player,
                  repeat: _repeat,
                  share: widget.presenter.shareFile,
                ))
              : Container(),
        ),
      ),
    );
  }

  Widget _question(String question, List<Color> colorScheme) {
    return Container(
        color: Colors.black,
        child: Stack(children: <Widget>[
          AspectRatio(
              aspectRatio:
                  widget?.model?.player?.value?.aspectRatio ?? 1080 / 1920,
              child: RepaintBoundary(
                key: scr,
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 6, top: 50, right: 6, bottom: 70),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: colorScheme,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            question,
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 70,
              right: 25,
              child: CircularPercentIndicator(
                addAutomaticKeepAlive: false,
                radius: 25.0,
                animation: true,
                animationDuration: 3000,
                lineWidth: 3.0,
                percent: 1.0,
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.white.withOpacity(0.5),
                progressColor: Colors.white,
              ))
        ]));
  }

  void _pageChanged(int index, BuildContext context) {
    if (index == 0) {
      _delayedNext(0);
    } else if (indexList.contains(index) && index != carusel.items.length - 1) {
      widget.presenter.stop();
      final videoPath = widget.model.currentFilePath;
      widget.presenter.addResult(index - 1, videoPath);
      _delayedNext(index);
    } else if (index == carusel.items.length - 1) {
      final videoPath = widget.model.currentFilePath;
      widget.presenter.stop();
      widget.presenter.encodeVideo(context, index - 1, videoPath);
    }
  }

  void _repeat() {
    indexList = [];
    widget.presenter.repeat();
    carusel.animateToPage(0,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _next() {
    carusel.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Future<String> _takeScreenshot(String hashcode) async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();
    final directory = (await getTemporaryDirectory()).path;

    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    File imgFile = new File('$directory/screenshot$hashcode.png');
    imgFile.writeAsBytes(pngBytes);
    return imgFile.path;
  }

  Future _delayedNext(int index) async {
    Future.delayed(const Duration(milliseconds: 3000)).then((result) async {
      var uuid = new Uuid();
      _nextItem(uuid.v1(), index);
    });
  }

  Future _nextItem(String question, int index) async {
    await _takeScreenshot(question.hashCode.toString()).then((result) {
      widget.presenter.addResult(index, result);
      _next();
    });
  }
}
