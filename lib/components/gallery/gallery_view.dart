import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:yops_interview/domain/middleware/epics/uri.dart';
import 'gallery_model.dart';
import 'gallery_presenter.dart';

class GalleryView extends StatelessWidget {
  final GalleryModel model;
  final GalleryPresenter presenter;

  GalleryView({@required this.model, this.presenter});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: model.tag,
        child: Material(
            child: model.fullScreen
                ? _fullScreenGallery(
                    context, MediaQuery.of(context).size.height)
                : _gallery(context, model.height)));
  }

  Widget _gallery(BuildContext context, double height) {
    return Swiper(
        pagination: SwiperCustomPagination(
            builder: (BuildContext context, SwiperPluginConfig config) {
          return _pagination(config, height);
        }),
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
            new CustomLayoutOption(startIndex: 0, stateCount: 3).addTranslate([
          new Offset(-MediaQuery.of(context).size.width, 0.0),
          new Offset(0.0, 0.0),
          new Offset(MediaQuery.of(context).size.width, 0.0),
        ]),
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: height,
        itemCount: model.images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: CachedNetworkImage(
              height: height,
              placeholder: (context, url) => Center(
                  child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator())),
              imageUrl: attachmentUrl.toString() + '/' + model.images[index],
              fit: BoxFit.cover,
            ),
          );
        });
  }

  Widget _fullScreenGallery(BuildContext context, double height) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Swiper(
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
          itemCount: model.images.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Container(
              child: IgnorePointer(
                ignoring: true,
              ),
            ));
          }),
    );
  }

  Widget _pagination(SwiperPluginConfig config, double height) {
    return Container(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${config.activeIndex + 1}/${config.itemCount}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                            children: renderListDots(
                                config.activeIndex, config.itemCount)))
                  ],
                ))
          ],
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  presenter.back(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          ],
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Center(
                            child: _fullScreenCounter(
                                config.activeIndex + 1, config.itemCount))),
                    Flexible(fit: FlexFit.tight, child: Container()),
                  ],
                )),
          ],
        ));
  }

  Widget _fullScreenCounter(int currentPage, int countOfPages) {
    return Text(
      "$currentPage/$countOfPages",
      style: TextStyle(color: Colors.white),
    );
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
}
