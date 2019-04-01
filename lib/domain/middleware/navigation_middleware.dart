import 'package:yops_interview/domain/states/states.dart';
import 'package:yops_interview/navigation/dialog_route.dart';
import 'package:yops_interview/navigation/navigation.dart';
import 'package:built_redux/built_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/app_state.dart';
import 'package:yops_interview/navigation/routes.dart';
import 'package:yops_interview/navigation/nav_key.dart';

Store store;

MiddlewareBuilder<AppState, AppStateBuilder, AppActions>
    navigationMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
    ..add(AppActionsNames.routeTo, _routeTo)
    ..add(AppActionsNames.routeBack, _routeBack);
}

void _routeTo(MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
    ActionHandler next, Action<AppRoute> action) async {
  next(action);
  AppRoute routeSettings = action.payload;
  final navigatorKey = NavKey.navKey;

  debugPrint('route to "${routeSettings.route}"');

  switch (routeSettings.route) {
    case Routes.home:
      navigatorKey.currentState.pushNamedAndRemoveUntil(
          Routes.home, ModalRoute.withName(Routes.home));
      break;

    case Routes.underConstruction:
      navigatorKey.currentState.push(
        CupertinoPageRoute<void>(
            builder: (BuildContext context) => Container(
                  color: Colors.red,
                )),
      );
      break;
  }
}

Future<T> showGeneralDialog<T>({
  @required NavigatorState navigator,
  @required RoutePageBuilder pageBuilder,
  bool barrierDismissible,
  String barrierLabel,
  Color barrierColor,
  Duration transitionDuration,
  RouteTransitionsBuilder transitionBuilder,
}) {
  assert(pageBuilder != null);
  assert(!barrierDismissible || barrierLabel != null);
  return navigator.push<T>(DialogRoute<T>(
    pageBuilder: pageBuilder,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder,
  ));
}

void _routeBack(MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
    ActionHandler next, Action<void> action) async {
  next(action);
  final navigatorKey = NavKey.navKey;
  navigatorKey.currentState.pop();
}
