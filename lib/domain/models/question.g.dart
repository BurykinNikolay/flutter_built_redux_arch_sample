// GENERATED CODE - DO NOT MODIFY BY HAND

part of question;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Question> _$questionSerializer = new _$QuestionSerializer();

class _$QuestionSerializer implements StructuredSerializer<Question> {
  @override
  final Iterable<Type> types = const [Question, _$Question];
  @override
  final String wireName = 'Question';

  @override
  Iterable serialize(Serializers serializers, Question object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'questionList',
      serializers.serialize(object.questionList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Question deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'questionList':
          result.questionList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Question extends Question {
  @override
  final BuiltList<String> questionList;

  factory _$Question([void updates(QuestionBuilder b)]) =>
      (new QuestionBuilder()..update(updates)).build();

  _$Question._({this.questionList}) : super._() {
    if (questionList == null) {
      throw new BuiltValueNullFieldError('Question', 'questionList');
    }
  }

  @override
  Question rebuild(void updates(QuestionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBuilder toBuilder() => new QuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question && questionList == other.questionList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, questionList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Question')
          ..add('questionList', questionList))
        .toString();
  }
}

class QuestionBuilder implements Builder<Question, QuestionBuilder> {
  _$Question _$v;

  ListBuilder<String> _questionList;
  ListBuilder<String> get questionList =>
      _$this._questionList ??= new ListBuilder<String>();
  set questionList(ListBuilder<String> questionList) =>
      _$this._questionList = questionList;

  QuestionBuilder();

  QuestionBuilder get _$this {
    if (_$v != null) {
      _questionList = _$v.questionList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Question other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Question;
  }

  @override
  void update(void updates(QuestionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Question build() {
    _$Question _$result;
    try {
      _$result = _$v ?? new _$Question._(questionList: questionList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questionList';
        questionList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Question', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
