// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppRoute extends AppRoute {
  @override
  final String route;
  @override
  final Object arguments;
  @override
  final BuildContext context;

  factory _$AppRoute([void updates(AppRouteBuilder b)]) =>
      (new AppRouteBuilder()..update(updates)).build();

  _$AppRoute._({this.route, this.arguments, this.context}) : super._() {
    if (route == null) {
      throw new BuiltValueNullFieldError('AppRoute', 'route');
    }
  }

  @override
  AppRoute rebuild(void updates(AppRouteBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppRouteBuilder toBuilder() => new AppRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppRoute &&
        route == other.route &&
        arguments == other.arguments &&
        context == other.context;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, route.hashCode), arguments.hashCode), context.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppRoute')
          ..add('route', route)
          ..add('arguments', arguments)
          ..add('context', context))
        .toString();
  }
}

class AppRouteBuilder implements Builder<AppRoute, AppRouteBuilder> {
  _$AppRoute _$v;

  String _route;
  String get route => _$this._route;
  set route(String route) => _$this._route = route;

  Object _arguments;
  Object get arguments => _$this._arguments;
  set arguments(Object arguments) => _$this._arguments = arguments;

  BuildContext _context;
  BuildContext get context => _$this._context;
  set context(BuildContext context) => _$this._context = context;

  AppRouteBuilder();

  AppRouteBuilder get _$this {
    if (_$v != null) {
      _route = _$v.route;
      _arguments = _$v.arguments;
      _context = _$v.context;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppRoute other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppRoute;
  }

  @override
  void update(void updates(AppRouteBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppRoute build() {
    final _$result = _$v ??
        new _$AppRoute._(route: route, arguments: arguments, context: context);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
