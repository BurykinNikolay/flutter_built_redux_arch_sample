import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'camera_example.dart';
import 'question_carusel_presenter.dart';
import 'question_carusel_model.dart';

class QuestionCaruselView extends StatefulWidget {
  final QuestionCaruselModel model;
  final QuestionCaruselPresenter presenter;
  QuestionCaruselView({this.model, this.presenter});
  @override
  _QuestionCaruselViewState createState() => _QuestionCaruselViewState();
}

class _QuestionCaruselViewState extends State<QuestionCaruselView> {
  Widget camera;
  List<String> assets = [];
  List<String> results = [];
  var scr = new GlobalKey();
  CarouselSlider carusel;

  @override
  void initState() {
    super.initState();
    initCamera();
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
      camera = CameraExampleHome(
        controller: cameraController,
        next: _next,
      );
      await cameraController.initialize();
      widget.presenter.setCameraController(cameraController);
    } else {
      print("cameraController !=null");
      camera = CameraExampleHome(
        controller: widget.model.cameraController,
        next: _next,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: _fullScreenGallery(context, MediaQuery.of(context).size.height));
  }

  Widget _fullScreenGallery(BuildContext context, double height) {
    List<String> questions = widget.model.questionList;
    List<Widget> questionsWithCamera = [];
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
      questionsWithCamera.add(_question(question, colorScheme));

      //questionsWithCamera.add(question);
      questionsWithCamera.add(camera);
    }
    questionsWithCamera.add(_last(context));

    carusel = CarouselSlider(
      height: height,
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
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

  Widget _last(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text("share video"),
        onPressed: () {
          widget.presenter.encodeVideo(context, results);
        },
      ),
    );
  }

  Future<String> assetPath(String assetName) async {
    return join((await tempDirectory).path, assetName);
  }

  Future<Directory> get tempDirectory async {
    return await getTemporaryDirectory();
  }

  Widget _question(String question, List<Color> colorScheme) {
    return RepaintBoundary(
        key: scr,
        child: GestureDetector(
          onTap: () async {
            await _takeAScreenshot(question.hashCode.toString()).then((result) {
              _next(result);
            });
          },
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(left: 6, top: 50, right: 6, bottom: 70),
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
        ));
  }

  List<Widget> renderListDots(int currentPage, int intOfDots) {
    List<Widget> dots = [];
    for (int i = 0; i < intOfDots; i++) {
      Color currentColor;
      if (currentPage == i) {
        currentColor = Colors.white;
      } else {
        currentColor = Colors.white.withOpacity(0.5);
      }

      dots.add(renderDot(currentColor));
    }
    return dots;
  }

  Widget renderDot(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      width: 20,
      height: 4,
      margin: EdgeInsets.symmetric(horizontal: 2.5),
    );
  }

  _next(String path) {
    results.add(path);
    print(results);
    carusel.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Future<String> _takeAScreenshot(String hashcode) async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();
    final directory = (await getTemporaryDirectory()).path;

    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    File imgFile = new File('$directory/screenshot$hashcode.png');
    imgFile.writeAsBytes(pngBytes);
    return imgFile.path;
  }
}
