// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InterviewState> _$interviewStateSerializer =
    new _$InterviewStateSerializer();

class _$InterviewStateSerializer
    implements StructuredSerializer<InterviewState> {
  @override
  final Iterable<Type> types = const [InterviewState, _$InterviewState];
  @override
  final String wireName = 'InterviewState';

  @override
  Iterable serialize(Serializers serializers, InterviewState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.results != null) {
      result
        ..add('results')
        ..add(serializers.serialize(object.results,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.questions != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(object.questions,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
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
  InterviewState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InterviewStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
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

class _$InterviewState extends InterviewState {
  @override
  final BuiltList<String> results;
  @override
  final BuiltList<String> questions;
  @override
  final String path;
  @override
  final VideoPlayerController player;

  factory _$InterviewState([void Function(InterviewStateBuilder) updates]) =>
      (new InterviewStateBuilder()..update(updates)).build();

  _$InterviewState._({this.results, this.questions, this.path, this.player})
      : super._();

  @override
  InterviewState rebuild(void Function(InterviewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InterviewStateBuilder toBuilder() =>
      new InterviewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterviewState &&
        results == other.results &&
        questions == other.questions &&
        path == other.path &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, results.hashCode), questions.hashCode), path.hashCode),
        player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InterviewState')
          ..add('results', results)
          ..add('questions', questions)
          ..add('path', path)
          ..add('player', player))
        .toString();
  }
}

class InterviewStateBuilder
    implements Builder<InterviewState, InterviewStateBuilder> {
  _$InterviewState _$v;

  ListBuilder<String> _results;
  ListBuilder<String> get results =>
      _$this._results ??= new ListBuilder<String>();
  set results(ListBuilder<String> results) => _$this._results = results;

  ListBuilder<String> _questions;
  ListBuilder<String> get questions =>
      _$this._questions ??= new ListBuilder<String>();
  set questions(ListBuilder<String> questions) => _$this._questions = questions;

  String _path;
  String get path => _$this._path;
  set path(String path) => _$this._path = path;

  VideoPlayerController _player;
  VideoPlayerController get player => _$this._player;
  set player(VideoPlayerController player) => _$this._player = player;

  InterviewStateBuilder();

  InterviewStateBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _questions = _$v.questions?.toBuilder();
      _path = _$v.path;
      _player = _$v.player;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InterviewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InterviewState;
  }

  @override
  void update(void Function(InterviewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InterviewState build() {
    _$InterviewState _$result;
    try {
      _$result = _$v ??
          new _$InterviewState._(
              results: _results?.build(),
              questions: _questions?.build(),
              path: path,
              player: player);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
        _$failedField = 'questions';
        _questions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InterviewState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
