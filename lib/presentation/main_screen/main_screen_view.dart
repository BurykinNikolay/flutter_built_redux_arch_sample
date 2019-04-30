import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'main_screen_presenter.dart';
import 'main_screen_model.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenModel model;
  final MainScreenPresenter presenter;
  MainScreenView({this.model, this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      _appBar(context),
      SliverList(
        delegate: SliverChildListDelegate([
          _randomQuestions(),
          _questionGrid(),
          Container(
            height: 15,
          )
        ]),
      )
    ]);
  }

  Widget _appBar(BuildContext context) {
    final double _kAppBarHeight = MediaQuery.of(context).size.height / 3;
    return SliverAppBar(
      pinned: true,
      expandedHeight: _kAppBarHeight,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              Container(
                color: Color(0xFFF85F3F),
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/hero-banner01-2.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 20,
                top: 52,
                right: 20,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Intervie",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Montserrat")),
                    CupertinoButton(
                      minSize: 25,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      child: Text("Создать свой опрос",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Montserrat")),
                      onPressed: () {
                        presenter.openEditor();
                      },
                    )
                  ],
                )),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _randomQuestions() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xFF1E1F22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text("Случайные вопросы",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Montserrat"))),
          Container(
            margin: EdgeInsets.only(right: 25),
            width: 41,
            height: 41,
            child: Image.asset("assets/images/bitmap.png"),
          )
        ],
      ),
    );
  }

  Widget _questionGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10, right: 10),
      itemCount: model?.questions?.keys?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        String questionTitle = model.questions.keys.toList()[index];
        BuiltList<String> questionList =
            model.questions[model.questions.keys.toList()[index]];

        List<Color> colors = [];
        if (index.isEven) {
          colors = [
            Color(0xFFE6693A),
            Color(0xFFE7693F),
            Color(0xFFE9694F),
            Color(0xFFE96B60),
          ];
        } else {
          colors = [
            Color(0xFF4CABD6),
            Color(0xFF56BFDF),
            Color(0xFF65D9E8),
            Color(0xFF6AE1EC),
          ];
        }
        return GestureDetector(
            onTap: () {
              presenter.openInterview(questionList);
            },
            child: Container(
              height: 148,
              width: 163,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 140, minHeight: 120),
                  child: Center(
                    child: Text(
                      "$questionTitle",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
