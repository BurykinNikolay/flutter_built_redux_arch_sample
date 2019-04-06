import 'package:built_redux_rx/built_redux_rx.dart';
import 'epics/epics.dart';
import 'navigation_middleware.dart';
import 'user_middleware.dart';

final middlewares = [
  // createEpicMiddleware([]),
  navigationMiddleware().build(),
  createUserMiddleware().build(),
];
