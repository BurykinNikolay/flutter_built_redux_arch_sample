// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MainScreenState> _$mainScreenStateSerializer =
    new _$MainScreenStateSerializer();

class _$MainScreenStateSerializer
    implements StructuredSerializer<MainScreenState> {
  @override
  final Iterable<Type> types = const [MainScreenState, _$MainScreenState];
  @override
  final String wireName = 'MainScreenState';

  @override
  Iterable serialize(Serializers serializers, MainScreenState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'loading',
      serializers.serialize(object.loading,
          specifiedType: const FullType(bool)),
    ];
    if (object.questions != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(object.questions,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Question)])));
    }

    return result;
  }

  @override
  MainScreenState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainScreenStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Question)])) as BuiltList);
          break;
        case 'loading':
          result.loading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$MainScreenState extends MainScreenState {
  @override
  final BuiltList<Question> questions;
  @override
  final bool loading;

  factory _$MainScreenState([void updates(MainScreenStateBuilder b)]) =>
      (new MainScreenStateBuilder()..update(updates)).build();

  _$MainScreenState._({this.questions, this.loading}) : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('MainScreenState', 'loading');
    }
  }

  @override
  MainScreenState rebuild(void updates(MainScreenStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MainScreenStateBuilder toBuilder() =>
      new MainScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainScreenState &&
        questions == other.questions &&
        loading == other.loading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, questions.hashCode), loading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainScreenState')
          ..add('questions', questions)
          ..add('loading', loading))
        .toString();
  }
}

class MainScreenStateBuilder
    implements Builder<MainScreenState, MainScreenStateBuilder> {
  _$MainScreenState _$v;

  ListBuilder<Question> _questions;
  ListBuilder<Question> get questions =>
      _$this._questions ??= new ListBuilder<Question>();
  set questions(ListBuilder<Question> questions) =>
      _$this._questions = questions;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  MainScreenStateBuilder();

  MainScreenStateBuilder get _$this {
    if (_$v != null) {
      _questions = _$v.questions?.toBuilder();
      _loading = _$v.loading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainScreenState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MainScreenState;
  }

  @override
  void update(void updates(MainScreenStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MainScreenState build() {
    _$MainScreenState _$result;
    try {
      _$result = _$v ??
          new _$MainScreenState._(
              questions: _questions?.build(), loading: loading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        _questions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MainScreenState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
