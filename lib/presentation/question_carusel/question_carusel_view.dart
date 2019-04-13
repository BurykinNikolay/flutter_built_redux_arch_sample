import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:yops_interview/app/globals.dart' as globals;

import 'video_util.dart';
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
  //SwiperController controller;
  List<String> assets = [];
  List<String> results = [];
  var scr = new GlobalKey();
  CarouselSlider carusel;

  @override
  void initState() {
    super.initState();
    camera = CameraExampleHome(globals.cameras, _next);
    // controller = SwiperController();
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
    questionsWithCamera.add(_last());

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

  Widget _last() {
    return Center(
      child: CupertinoButton(
        child: Text("share video"),
        onPressed: () async {
          //  results.insert(1, "assets/video/sample.mp4");
          VideoUtil().encodeVideo(results);
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
              await _takeAScreenshot(question.hashCode.toString())
                  .then((result) {
                _next(result);
              });
            },
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
              )),
            )));
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

  // static Future<Directory> get tempDirectory async {
  //   return await getTemporaryDirectory();
  // }

  // static Future<File> copyFileAssets(String assetName, String localName) async {
  //   final ByteData assetByteData = await rootBundle.load(assetName);

  //   final List<int> byteList = assetByteData.buffer
  //       .asUint8List(assetByteData.offsetInBytes, assetByteData.lengthInBytes);

  //   final String fullTemporaryPath =
  //       join((await tempDirectory).path, localName);

  //   return new File(fullTemporaryPath)
  //       .writeAsBytes(byteList, mode: FileMode.writeOnly, flush: true);
  // }

}
