// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TabState> _$tabStateSerializer = new _$TabStateSerializer();

class _$TabStateSerializer implements StructuredSerializer<TabState> {
  @override
  final Iterable<Type> types = const [TabState, _$TabState];
  @override
  final String wireName = 'TabState';

  @override
  Iterable serialize(Serializers serializers, TabState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activeTab',
      serializers.serialize(object.activeTab,
          specifiedType: const FullType(AppTab)),
    ];

    return result;
  }

  @override
  TabState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TabStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activeTab':
          result.activeTab = serializers.deserialize(value,
              specifiedType: const FullType(AppTab)) as AppTab;
          break;
      }
    }

    return result.build();
  }
}

class _$TabState extends TabState {
  @override
  final AppTab activeTab;

  factory _$TabState([void Function(TabStateBuilder) updates]) =>
      (new TabStateBuilder()..update(updates)).build();

  _$TabState._({this.activeTab}) : super._() {
    if (activeTab == null) {
      throw new BuiltValueNullFieldError('TabState', 'activeTab');
    }
  }

  @override
  TabState rebuild(void Function(TabStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TabStateBuilder toBuilder() => new TabStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TabState && activeTab == other.activeTab;
  }

  @override
  int get hashCode {
    return $jf($jc(0, activeTab.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TabState')
          ..add('activeTab', activeTab))
        .toString();
  }
}

class TabStateBuilder implements Builder<TabState, TabStateBuilder> {
  _$TabState _$v;

  AppTab _activeTab;
  AppTab get activeTab => _$this._activeTab;
  set activeTab(AppTab activeTab) => _$this._activeTab = activeTab;

  TabStateBuilder();

  TabStateBuilder get _$this {
    if (_$v != null) {
      _activeTab = _$v.activeTab;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TabState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TabState;
  }

  @override
  void update(void Function(TabStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TabState build() {
    final _$result = _$v ?? new _$TabState._(activeTab: activeTab);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
