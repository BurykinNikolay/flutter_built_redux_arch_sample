// GENERATED CODE - DO NOT MODIFY BY HAND

part of application;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tabState',
      serializers.serialize(object.tabState,
          specifiedType: const FullType(TabState)),
      'mainScreenState',
      serializers.serialize(object.mainScreenState,
          specifiedType: const FullType(MainScreenState)),
      'userState',
      serializers.serialize(object.userState,
          specifiedType: const FullType(UserState)),
      'questionState',
      serializers.serialize(object.questionState,
          specifiedType: const FullType(QuestionsState)),
      'cameraState',
      serializers.serialize(object.cameraState,
          specifiedType: const FullType(CameraState)),
      'interviewState',
      serializers.serialize(object.interviewState,
          specifiedType: const FullType(InterviewState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'tabState':
          result.tabState.replace(serializers.deserialize(value,
              specifiedType: const FullType(TabState)) as TabState);
          break;
        case 'mainScreenState':
          result.mainScreenState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(MainScreenState))
              as MainScreenState);
          break;
        case 'userState':
          result.userState.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserState)) as UserState);
          break;
        case 'questionState':
          result.questionState.replace(serializers.deserialize(value,
              specifiedType: const FullType(QuestionsState)) as QuestionsState);
          break;
        case 'cameraState':
          result.cameraState.replace(serializers.deserialize(value,
              specifiedType: const FullType(CameraState)) as CameraState);
          break;
        case 'interviewState':
          result.interviewState.replace(serializers.deserialize(value,
              specifiedType: const FullType(InterviewState)) as InterviewState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final TabState tabState;
  @override
  final MainScreenState mainScreenState;
  @override
  final UserState userState;
  @override
  final QuestionsState questionState;
  @override
  final CameraState cameraState;
  @override
  final InterviewState interviewState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.tabState,
      this.mainScreenState,
      this.userState,
      this.questionState,
      this.cameraState,
      this.interviewState})
      : super._() {
    if (tabState == null) {
      throw new BuiltValueNullFieldError('AppState', 'tabState');
    }
    if (mainScreenState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mainScreenState');
    }
    if (userState == null) {
      throw new BuiltValueNullFieldError('AppState', 'userState');
    }
    if (questionState == null) {
      throw new BuiltValueNullFieldError('AppState', 'questionState');
    }
    if (cameraState == null) {
      throw new BuiltValueNullFieldError('AppState', 'cameraState');
    }
    if (interviewState == null) {
      throw new BuiltValueNullFieldError('AppState', 'interviewState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        tabState == other.tabState &&
        mainScreenState == other.mainScreenState &&
        userState == other.userState &&
        questionState == other.questionState &&
        cameraState == other.cameraState &&
        interviewState == other.interviewState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, tabState.hashCode), mainScreenState.hashCode),
                    userState.hashCode),
                questionState.hashCode),
            cameraState.hashCode),
        interviewState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('tabState', tabState)
          ..add('mainScreenState', mainScreenState)
          ..add('userState', userState)
          ..add('questionState', questionState)
          ..add('cameraState', cameraState)
          ..add('interviewState', interviewState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  TabStateBuilder _tabState;
  TabStateBuilder get tabState => _$this._tabState ??= new TabStateBuilder();
  set tabState(TabStateBuilder tabState) => _$this._tabState = tabState;

  MainScreenStateBuilder _mainScreenState;
  MainScreenStateBuilder get mainScreenState =>
      _$this._mainScreenState ??= new MainScreenStateBuilder();
  set mainScreenState(MainScreenStateBuilder mainScreenState) =>
      _$this._mainScreenState = mainScreenState;

  UserStateBuilder _userState;
  UserStateBuilder get userState =>
      _$this._userState ??= new UserStateBuilder();
  set userState(UserStateBuilder userState) => _$this._userState = userState;

  QuestionsStateBuilder _questionState;
  QuestionsStateBuilder get questionState =>
      _$this._questionState ??= new QuestionsStateBuilder();
  set questionState(QuestionsStateBuilder questionState) =>
      _$this._questionState = questionState;

  CameraStateBuilder _cameraState;
  CameraStateBuilder get cameraState =>
      _$this._cameraState ??= new CameraStateBuilder();
  set cameraState(CameraStateBuilder cameraState) =>
      _$this._cameraState = cameraState;

  InterviewStateBuilder _interviewState;
  InterviewStateBuilder get interviewState =>
      _$this._interviewState ??= new InterviewStateBuilder();
  set interviewState(InterviewStateBuilder interviewState) =>
      _$this._interviewState = interviewState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _tabState = _$v.tabState?.toBuilder();
      _mainScreenState = _$v.mainScreenState?.toBuilder();
      _userState = _$v.userState?.toBuilder();
      _questionState = _$v.questionState?.toBuilder();
      _cameraState = _$v.cameraState?.toBuilder();
      _interviewState = _$v.interviewState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              tabState: tabState.build(),
              mainScreenState: mainScreenState.build(),
              userState: userState.build(),
              questionState: questionState.build(),
              cameraState: cameraState.build(),
              interviewState: interviewState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tabState';
        tabState.build();
        _$failedField = 'mainScreenState';
        mainScreenState.build();
        _$failedField = 'userState';
        userState.build();
        _$failedField = 'questionState';
        questionState.build();
        _$failedField = 'cameraState';
        cameraState.build();
        _$failedField = 'interviewState';
        interviewState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
