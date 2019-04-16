// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carusel_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CaruselState> _$caruselStateSerializer =
    new _$CaruselStateSerializer();

class _$CaruselStateSerializer implements StructuredSerializer<CaruselState> {
  @override
  final Iterable<Type> types = const [CaruselState, _$CaruselState];
  @override
  final String wireName = 'CaruselState';

  @override
  Iterable serialize(Serializers serializers, CaruselState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.path != null) {
      result
        ..add('path')
        ..add(serializers.serialize(object.path,
            specifiedType: const FullType(String)));
    }
    if (object.player != null) {
      result
        ..add('player')
        ..add(serializers.serialize(object.player,
            specifiedType: const FullType(VideoPlayerController)));
    }

    return result;
  }

  @override
  CaruselState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CaruselStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'player':
          result.player = serializers.deserialize(value,
                  specifiedType: const FullType(VideoPlayerController))
              as VideoPlayerController;
          break;
      }
    }

    return result.build();
  }
}

class _$CaruselState extends CaruselState {
  @override
  final String path;
  @override
  final VideoPlayerController player;

  factory _$CaruselState([void updates(CaruselStateBuilder b)]) =>
      (new CaruselStateBuilder()..update(updates)).build();

  _$CaruselState._({this.path, this.player}) : super._();

  @override
  CaruselState rebuild(void updates(CaruselStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CaruselStateBuilder toBuilder() => new CaruselStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CaruselState &&
        path == other.path &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, path.hashCode), player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CaruselState')
          ..add('path', path)
          ..add('player', player))
        .toString();
  }
}

class CaruselStateBuilder
    implements Builder<CaruselState, CaruselStateBuilder> {
  _$CaruselState _$v;

  String _path;
  String get path => _$this._path;
  set path(String path) => _$this._path = path;

  VideoPlayerController _player;
  VideoPlayerController get player => _$this._player;
  set player(VideoPlayerController player) => _$this._player = player;

  CaruselStateBuilder();

  CaruselStateBuilder get _$this {
    if (_$v != null) {
      _path = _$v.path;
      _player = _$v.player;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CaruselState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CaruselState;
  }

  @override
  void update(void updates(CaruselStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CaruselState build() {
    final _$result = _$v ?? new _$CaruselState._(path: path, player: player);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
