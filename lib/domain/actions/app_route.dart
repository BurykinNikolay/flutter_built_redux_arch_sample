import 'package:flutter/material.dart' show BuildContext;
import 'package:built_value/built_value.dart';

part 'app_route.g.dart';

abstract class AppRoute implements Built<AppRoute, AppRouteBuilder> {

  String get route;

  @nullable
  Object get arguments;

  @nullable
  BuildContext get context;

  AppRoute._();

  factory AppRoute([updates(AppRouteBuilder buider)]) = _$AppRoute;
  factory AppRoute.from(String routeName, {Object arguments}) => _$AppRoute((b) {
    b.route = routeName;
    b.arguments = arguments;
    // do not set context as it will be deprecated soon
  });
}
