import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Redux packages
import 'package:built_redux/built_redux.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

//Store
import 'package:yops_interview/domain/states/states.dart';
import 'package:yops_interview/domain/actions/actions.dart';

//Domain

//Containers

//Components - stupid elements without Redux

//Other
import 'package:yops_interview/navigation/routes.dart';
import 'package:yops_interview/navigation/nav_key.dart';

import 'package:yops_interview/presentation/presenters.dart';

import 'package:yops_interview/app/globals.dart' as globals;

class YopsInterviewApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YopsInterviewAppState();
  }
}

class YopsInterviewAppState extends State<YopsInterviewApp> {
  Store<AppState, AppStateBuilder, AppActions> store;

  var routes = {
    Routes.home: (context) => HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: globals.store,
      child: MaterialApp(
        navigatorKey: NavKey.navKey,
        title: "yops_interview",
        routes: routes,
        initialRoute: Routes.home,
      ),
    );
  }
}
