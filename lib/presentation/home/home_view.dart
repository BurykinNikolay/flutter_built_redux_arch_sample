import 'active_tab.dart';
import 'home_container.dart';
import 'package:yops_interview/domain/models/models.dart';
import 'package:flutter/material.dart';

import 'package:yops_interview/presentation/presentation.dart';
import 'package:yops_interview/components/components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return Scaffold(
            body: _body(activeTab), bottomNavigationBar: HomeContainer());
      },
    );
  }

  Widget _body(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.main:
        return MainScreen();
      case AppTab.favorite:
        return Page404();
      case AppTab.answers:
        return Page404();
      case AppTab.profile:
        return Page404();
      default:
        return Page404();
    }
  }
}
