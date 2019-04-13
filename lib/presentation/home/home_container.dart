import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';
import 'package:yops_interview/domain/models/models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

typedef OnTabsSelected = void Function(int);

class HomeContainer extends StoreConnector<AppState, AppActions, AppTab> {
  HomeContainer({Key key}) : super(key: key);

  @override
  AppTab connect(AppState state) => state.tabState.activeTab;

  @override
  Widget build(BuildContext context, AppTab activeTab, AppActions action) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: AppTab.toIndex(activeTab),
      onTap: (index) {
        action.tab.updateTabAction(AppTab.fromIndex(index));
      },
      items: AppTab.values.map((tab) {
        var tabColor = tab == activeTab
            ? Theme.of(context).accentColor
            : Theme.of(context).disabledColor;
        return BottomNavigationBarItem(
            icon: Icon(
              _iconFromTab(tab),
              color: tabColor,
              size: 20,
            ),
            title: Text(
              _tabName(tab),
              style: TextStyle(color: tabColor, fontSize: 10),
              textAlign: TextAlign.center,
            ));
      }).toList(),
    );
  }

  String _tabName(AppTab appTab) {
    switch (appTab) {
      case AppTab.favorite:
        return "Избранное";
      case AppTab.main:
        return 'Главная';
      case AppTab.answers:
        return 'Мои ответы';
      case AppTab.profile:
        return 'Профиль';
      default:
        throw 'no case for "$appTab"';
    }
  }

  static IconData _iconFromTab(AppTab appTab) {
    switch (appTab) {
      case AppTab.main:
        return Icons.question_answer;
      case AppTab.favorite:
        return Icons.favorite;
      case AppTab.answers:
        return Icons.video_label;

      case AppTab.profile:
        return Icons.person;
      default:
        return Icons.person;
    }
  }
}
