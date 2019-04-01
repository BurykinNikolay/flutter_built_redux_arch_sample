// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserState> _$userStateSerializer = new _$UserStateSerializer();

class _$UserStateSerializer implements StructuredSerializer<UserState> {
  @override
  final Iterable<Type> types = const [UserState, _$UserState];
  @override
  final String wireName = 'UserState';

  @override
  Iterable serialize(Serializers serializers, UserState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.loggedIn != null) {
      result
        ..add('loggedIn')
        ..add(serializers.serialize(object.loggedIn,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  UserState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'loggedIn':
          result.loggedIn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserState extends UserState {
  @override
  final bool loggedIn;

  factory _$UserState([void updates(UserStateBuilder b)]) =>
      (new UserStateBuilder()..update(updates)).build();

  _$UserState._({this.loggedIn}) : super._();

  @override
  UserState rebuild(void updates(UserStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState && loggedIn == other.loggedIn;
  }

  @override
  int get hashCode {
    return $jf($jc(0, loggedIn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')..add('loggedIn', loggedIn))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  _$UserState _$v;

  bool _loggedIn;
  bool get loggedIn => _$this._loggedIn;
  set loggedIn(bool loggedIn) => _$this._loggedIn = loggedIn;

  UserStateBuilder();

  UserStateBuilder get _$this {
    if (_$v != null) {
      _loggedIn = _$v.loggedIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserState;
  }

  @override
  void update(void updates(UserStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserState build() {
    final _$result = _$v ?? new _$UserState._(loggedIn: loggedIn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
