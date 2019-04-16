// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carusel_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$CaruselAction extends CaruselAction {
  factory _$CaruselAction() => new _$CaruselAction._();
  _$CaruselAction._() : super._();

  final ActionDispatcher<String> setPath =
      new ActionDispatcher<String>('CaruselAction-setPath');
  final ActionDispatcher<VideoPlayerController> setPlayer =
      new ActionDispatcher<VideoPlayerController>('CaruselAction-setPlayer');
  final ActionDispatcher<void> clearPath =
      new ActionDispatcher<void>('CaruselAction-clearPath');
  final ActionDispatcher<void> repeat =
      new ActionDispatcher<void>('CaruselAction-repeat');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    setPath.setDispatcher(dispatcher);
    setPlayer.setDispatcher(dispatcher);
    clearPath.setDispatcher(dispatcher);
    repeat.setDispatcher(dispatcher);
  }
}

class CaruselActionNames {
  static final ActionName<String> setPath =
      new ActionName<String>('CaruselAction-setPath');
  static final ActionName<VideoPlayerController> setPlayer =
      new ActionName<VideoPlayerController>('CaruselAction-setPlayer');
  static final ActionName<void> clearPath =
      new ActionName<void>('CaruselAction-clearPath');
  static final ActionName<void> repeat =
      new ActionName<void>('CaruselAction-repeat');
}
