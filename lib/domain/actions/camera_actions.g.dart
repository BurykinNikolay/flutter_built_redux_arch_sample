// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$CameraAction extends CameraAction {
  factory _$CameraAction() => new _$CameraAction._();
  _$CameraAction._() : super._();

  final ActionDispatcher<List<CameraDescription>> setCameras =
      new ActionDispatcher<List<CameraDescription>>('CameraAction-setCameras');
  final ActionDispatcher<CameraDescription> setCameraDescription =
      new ActionDispatcher<CameraDescription>(
          'CameraAction-setCameraDescription');
  final ActionDispatcher<CameraController> setCameraController =
      new ActionDispatcher<CameraController>(
          'CameraAction-setCameraController');
  final ActionDispatcher<String> setCurrentFilePath =
      new ActionDispatcher<String>('CameraAction-setCurrentFilePath');
  final ActionDispatcher<String> start =
      new ActionDispatcher<String>('CameraAction-start');
  final ActionDispatcher<void> stop =
      new ActionDispatcher<void>('CameraAction-stop');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    setCameras.setDispatcher(dispatcher);
    setCameraDescription.setDispatcher(dispatcher);
    setCameraController.setDispatcher(dispatcher);
    setCurrentFilePath.setDispatcher(dispatcher);
    start.setDispatcher(dispatcher);
    stop.setDispatcher(dispatcher);
  }
}

class CameraActionNames {
  static final ActionName<List<CameraDescription>> setCameras =
      new ActionName<List<CameraDescription>>('CameraAction-setCameras');
  static final ActionName<CameraDescription> setCameraDescription =
      new ActionName<CameraDescription>('CameraAction-setCameraDescription');
  static final ActionName<CameraController> setCameraController =
      new ActionName<CameraController>('CameraAction-setCameraController');
  static final ActionName<String> setCurrentFilePath =
      new ActionName<String>('CameraAction-setCurrentFilePath');
  static final ActionName<String> start =
      new ActionName<String>('CameraAction-start');
  static final ActionName<void> stop =
      new ActionName<void>('CameraAction-stop');
}
