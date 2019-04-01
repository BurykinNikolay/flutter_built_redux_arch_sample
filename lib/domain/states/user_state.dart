import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  @nullable
  bool get loggedIn;

  UserState._();

  factory UserState([updates(UserStateBuilder b)]) => new _$UserState((b) => b
    ..loggedIn = false
    ..update(updates));

  static Serializer<UserState> get serializer => _$userStateSerializer;
}
