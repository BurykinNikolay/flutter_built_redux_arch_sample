import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

NestedReducerBuilder<AppState, AppStateBuilder, CaruselState,
    CaruselStateBuilder> createCaruselReducer() => new NestedReducerBuilder<
        AppState, AppStateBuilder, CaruselState, CaruselStateBuilder>(
    (state) => state.caruselState, (builder) => builder.caruselState)
  ..add<String>(CaruselActionNames.setPath, _setPath)
  ..add<void>(CaruselActionNames.clearPath, _clearPath)
  ..add<VideoPlayerController>(CaruselActionNames.setPlayer, _setPlayer)
  ..add<void>(CaruselActionNames.repeat, _repeat);

_setPath(
    CaruselState state, Action<String> action, CaruselStateBuilder builder) {
  builder.path = action.payload;
}

_setPlayer(CaruselState state, Action<VideoPlayerController> action,
    CaruselStateBuilder builder) {
  final VideoPlayerController player = action.payload;
  // player.play();
  builder.player = player;
}

_clearPath(
    CaruselState state, Action<void> action, CaruselStateBuilder builder) {
  builder.path = "";
}

_repeat(CaruselState state, Action<void> action, CaruselStateBuilder builder) {
  print("repeat");
}
