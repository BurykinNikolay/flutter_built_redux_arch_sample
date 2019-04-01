import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:yops_interview/app/icons.dart';
import 'package:yops_interview/app/theme/app_theme.dart';

import 'package:yops_interview/domain/models/models.dart';

import 'main_screen_presenter.dart';
import 'main_screen_model.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenModel model;
  final MainScreenPresenter presenter;
  MainScreenView({this.model, this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
          _questionGrid(),
        ]),
      )
    ]);
  }

  Widget _questionGrid() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10, top: 15, right: 10),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              color: Colors.red,
            ));
      },
    );
  }
}
