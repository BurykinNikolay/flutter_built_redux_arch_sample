// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_tab;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppTab _$main = const AppTab._('main');
const AppTab _$favorite = const AppTab._('favorite');
const AppTab _$answers = const AppTab._('answers');
const AppTab _$profile = const AppTab._('profile');

AppTab _$appTabValueOf(String name) {
  switch (name) {
    case 'main':
      return _$main;
    case 'favorite':
      return _$favorite;
    case 'answers':
      return _$answers;
    case 'profile':
      return _$profile;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppTab> _$appTabValues = new BuiltSet<AppTab>(const <AppTab>[
  _$main,
  _$favorite,
  _$answers,
  _$profile,
]);

Serializer<AppTab> _$appTabSerializer = new _$AppTabSerializer();

class _$AppTabSerializer implements PrimitiveSerializer<AppTab> {
  @override
  final Iterable<Type> types = const <Type>[AppTab];
  @override
  final String wireName = 'AppTab';

  @override
  Object serialize(Serializers serializers, AppTab object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppTab deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppTab.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
