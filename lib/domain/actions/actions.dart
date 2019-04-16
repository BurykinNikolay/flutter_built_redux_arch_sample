library actions;

import 'package:built_redux/built_redux.dart';

import 'app_route.dart';
export 'app_route.dart';

import 'tab_actions.dart';
export 'tab_actions.dart';

import 'question_actions.dart';
export 'question_actions.dart';

import 'camera_actions.dart';
export 'camera_actions.dart';

import 'carusel_actions.dart';
export 'carusel_actions.dart';

part 'actions.g.dart';

abstract class AppActions extends ReduxActions {
  AppActions._();

  ActionDispatcher<AppRoute> get routeTo;
  ActionDispatcher<void> get routeBack;

  TabActions get tab;
  QuestionsAction get question;
  CameraAction get camera;
  CaruselAction get carusel;

  factory AppActions() => new _$AppActions();
}
