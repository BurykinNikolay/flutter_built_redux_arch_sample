// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<AppRoute> routeTo =
      new ActionDispatcher<AppRoute>('AppActions-routeTo');
  final ActionDispatcher<void> routeBack =
      new ActionDispatcher<void>('AppActions-routeBack');
  final TabActions tab = new TabActions();
  final QuestionsAction question = new QuestionsAction();
  final CameraAction camera = new CameraAction();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    routeTo.setDispatcher(dispatcher);
    routeBack.setDispatcher(dispatcher);
    tab.setDispatcher(dispatcher);
    question.setDispatcher(dispatcher);
    camera.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<AppRoute> routeTo =
      new ActionName<AppRoute>('AppActions-routeTo');
  static final ActionName<void> routeBack =
      new ActionName<void>('AppActions-routeBack');
}
