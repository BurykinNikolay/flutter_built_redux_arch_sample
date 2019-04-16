import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';

part 'carusel_actions.g.dart';

abstract class CaruselAction extends ReduxActions {
  CaruselAction._();

  ActionDispatcher<String> get setPath;
  ActionDispatcher<VideoPlayerController> get setPlayer;

  ActionDispatcher<void> get clearPath;
  ActionDispatcher<void> get repeat;

  factory CaruselAction() => new _$CaruselAction();
}
