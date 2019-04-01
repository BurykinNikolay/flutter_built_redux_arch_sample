import 'dart:async';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:share_extend/share_extend.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:camera/camera.dart';
import 'camera_example.dart';
import 'ffmpeg.dart';

import 'package:path_provider/path_provider.dart';

class QuestionCarusel extends StatefulWidget {
  final List<CameraDescription> cameras;
  QuestionCarusel(this.cameras);

  @override
  _QuestionCaruselState createState() {
    return _QuestionCaruselState();
  }
}

class _QuestionCaruselState extends State<QuestionCarusel> {
  Widget camera;
  SwiperController controller;
  List<String> assets = [];
  var scr = new GlobalKey();
  @override
  void initState() {
    super.initState();
    camera = CameraExampleHome(widget.cameras, _next);
    controller = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: _fullScreenGallery(context, MediaQuery.of(context).size.height));
  }

  Widget _fullScreenGallery(BuildContext context, double height) {
    List<String> questions = [
      "",
      "Кушаешь сладкий хлеб?",
      "",
      "Покажи цаплю",
      "",
      "Расскажи историю"
    ];
    return Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Swiper(
            controller: controller,
            onTap: (index) {
              _next();
              _takeAScreenshot(index).then((path) {
                assets.add(path);
              });
            },
            loop: false,
            pagination: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
              return _fullScreenPagination(context, config, height);
            }),
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                new CustomLayoutOption(startIndex: 0, stateCount: 3)
                    .addTranslate([
              new Offset(-MediaQuery.of(context).size.width, 0.0),
              new Offset(0.0, 0.0),
              new Offset(MediaQuery.of(context).size.width, 0.0),
            ]),
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: height,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              if (index == 6) {
                return _last();
              }
              if (!index.isEven) {
                return _question(questions[index]);
              } else {
                return camera;
              }
            }));
  }

  Widget _last() {
    return Center(
      child: CupertinoButton(
        child: Text("share video"),
        onPressed: () async {
          VideoUtil().testEncodeVideo(assets);
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

  Widget _question(String question) {
    return RepaintBoundary(
        key: scr,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400],
              ],
            ),
          ),
          child: Center(
              child: Text(
            question,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
        ));
  }

  Widget _fullScreenPagination(
      BuildContext context, SwiperPluginConfig config, double height) {
    return Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // IconButton(
                    //   padding: EdgeInsets.all(0.0),
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.arrow_back,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                )),
            Expanded(child: Container()),
            Padding(
                padding: EdgeInsets.only(left: 32.0, right: 20.0, bottom: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: renderListDots(
                            config.activeIndex, config.itemCount),
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Container(),
                    ])),
          ],
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

  _next() {
    controller.next();
  }

  Future<String> _takeAScreenshot(int index) async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();
    final directory = (await getTemporaryDirectory()).path;

    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    File imgFile = new File('$directory/screenshot$index.png');
    imgFile.writeAsBytes(pngBytes);
    return imgFile.path;
  }

  void _shareFile(String outputFilePath) async {
    var file = File(outputFilePath);
    ShareExtend.share(file.path, "file");
  }
}
