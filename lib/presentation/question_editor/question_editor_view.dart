import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'question_editor_presenter.dart';
import 'question_editor_model.dart';

class QuestionEditorView extends StatefulWidget {
  final QuestionEditorModel model;
  final QuestionEditorPresenter presenter;
  QuestionEditorView({this.model, this.presenter});

  _QuestionEditorViewState createState() => _QuestionEditorViewState();
}

class _QuestionEditorViewState extends State<QuestionEditorView> {
  List<TextEditingController> questionList = [TextEditingController()];
  TextEditingController _nameEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: _appBar(),
          body: _body(context),
          resizeToAvoidBottomPadding: false,
        ));
  }

  Widget _appBar() {
    return CupertinoNavigationBar(
      actionsForegroundColor: Colors.white,
      backgroundColor: Color(0xFFE76A4B),
      trailing: CupertinoButton(
        borderRadius: BorderRadius.circular(13.5),
        color: Colors.white,
        minSize: 27,
        padding: EdgeInsets.symmetric(horizontal: 13.5),
        onPressed: () {
          _saveAndSend();
        },
        child: Text(
          "Сохранить",
          style: TextStyle(
              fontSize: 12, fontFamily: "Montserrat", color: Colors.black),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(_questionBuilder()),
              )
            ])),
        // _saveAndSendButton()
      ],
    );
  }

  Widget _saveAndSendButton() {
    return Positioned(
      left: 25,
      right: 25,
      bottom: 50,
      child: GestureDetector(
          onTap: () {
            _saveAndSend();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Color(0xFFE6693A),
                    Color(0xFFE7693F),
                    Color(0xFFE9694F),
                    Color(0xFFE96B60),
                  ],
                )),
            child: Center(
                child: Text("СОХРАНИТЬ И ОТПРАВИТЬ",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        color: Colors.white))),
          )),
    );
  }

  List<Widget> _questionBuilder() {
    final items = List<Widget>.generate(
        questionList.length, (index) => _item(questionList[index], index));
    items.insert(0, _nameOfQuestionList());
    items.add(_addQuestionButton());

    return items;
  }

  _nameOfQuestionList() {
    return Padding(
        padding: EdgeInsets.only(bottom: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ВВЕДИТЕ НАЗВАНИЕ ОПРОСА",
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 39, 44).withOpacity(0.3),
                    fontSize: 12.5,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                )),
            Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: _nameEditController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.67,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                )),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ))
              ],
            ),
          ],
        ));
  }

  _item(TextEditingController textController, int index) {
    return Padding(
        padding: EdgeInsets.only(bottom: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${index + 1} ВОПРОС",
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 39, 44).withOpacity(0.3),
                    fontSize: 12.5,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                )),
            Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: textController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.67,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.left,
                )),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ))
              ],
            ),
          ],
        ));
  }

  Widget _addQuestionButton() {
    return Padding(
        padding: EdgeInsets.only(top: 32, bottom: 150),
        child: CupertinoButton(
          minSize: 50,
          padding: EdgeInsets.all(0),
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(255, 199, 199, 199),
          onPressed: () {
            setState(() {
              questionList.add(TextEditingController());
            });
          },
          child: Text("ДОБАВИТЬ ВОПРОС",
              style: TextStyle(
                  fontSize: 14, fontFamily: "Montserrat", color: Colors.white)),
        ));
  }

  _saveAndSend() {
    BuiltMap<String, BuiltList<String>> questionMapBuilder =
        BuiltMap<String, BuiltList<String>>();
    final question = questionMapBuilder.rebuild((updates) {
      List<String> questionStringList = [];
      questionList.forEach((controller) {
        questionStringList.add(controller.text);
      });
      updates[_nameEditController.text] =
          BuiltList<String>.from(questionStringList);
      return updates;
    });
    widget.presenter.saveAndSendQuestion(question);
    widget.presenter.startProgress(context);
  }
}
