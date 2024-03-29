// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionsState> _$questionsStateSerializer =
    new _$QuestionsStateSerializer();

class _$QuestionsStateSerializer
    implements StructuredSerializer<QuestionsState> {
  @override
  final Iterable<Type> types = const [QuestionsState, _$QuestionsState];
  @override
  final String wireName = 'QuestionsState';

  @override
  Iterable serialize(Serializers serializers, QuestionsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.questions != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(object.questions,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(String)])
            ])));
    }

    return result;
  }

  @override
  QuestionsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(String)])
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionsState extends QuestionsState {
  @override
  final BuiltMap<String, BuiltList<String>> questions;

  factory _$QuestionsState([void Function(QuestionsStateBuilder) updates]) =>
      (new QuestionsStateBuilder()..update(updates)).build();

  _$QuestionsState._({this.questions}) : super._();

  @override
  QuestionsState rebuild(void Function(QuestionsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionsStateBuilder toBuilder() =>
      new QuestionsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionsState && questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionsState')
          ..add('questions', questions))
        .toString();
  }
}

class QuestionsStateBuilder
    implements Builder<QuestionsState, QuestionsStateBuilder> {
  _$QuestionsState _$v;

  MapBuilder<String, BuiltList<String>> _questions;
  MapBuilder<String, BuiltList<String>> get questions =>
      _$this._questions ??= new MapBuilder<String, BuiltList<String>>();
  set questions(MapBuilder<String, BuiltList<String>> questions) =>
      _$this._questions = questions;

  QuestionsStateBuilder();

  QuestionsStateBuilder get _$this {
    if (_$v != null) {
      _questions = _$v.questions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$QuestionsState;
  }

  @override
  void update(void Function(QuestionsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionsState build() {
    _$QuestionsState _$result;
    try {
      _$result = _$v ?? new _$QuestionsState._(questions: _questions?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        _questions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuestionsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
