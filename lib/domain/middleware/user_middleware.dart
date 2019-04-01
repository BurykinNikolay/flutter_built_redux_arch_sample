import 'dart:convert';

import 'package:built_redux/built_redux.dart';
import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/serializers.dart';
import 'package:yops_interview/domain/states/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yops_interview/domain/states/states.dart';

const USER_STATE_STORE_KEY = "USER_STATE_STORE_KEY";

MiddlewareBuilder<AppState, AppStateBuilder, AppActions>
    createUserMiddleware() =>
        MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
        // ..add<void>(UserActionsNames.storeUserState, _storeUserState)
        // ..add<void>(UserActionsNames.restoreUserState, _restoreUserState)
        // ..add<void>(UserActionsNames.clearUserState, _clearUserState)

        ;

// void _storeUserState(MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
//     ActionHandler next, Action<void> action) async {
//   next(action);

//   try {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(
//         USER_STATE_STORE_KEY,
//         json.encode(serializers.serializeWith(
//             UserState.serializer, api.state.userState)));
//   } catch (e) {
//     print(e.toString());
//   }
// }

// void _restoreUserState(MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
//     ActionHandler next, Action<void> action) async {
//   next(action);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final data = prefs.getString(USER_STATE_STORE_KEY) ?? "";
//   if (data.isNotEmpty) {
//     try {
//       final state =
//           serializers.deserializeWith(UserState.serializer, json.decode(data));
//       api.actions.user.setUserState(state);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// void _clearUserState(MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
//     ActionHandler next, Action<void> action) async {
//   next(action);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.remove(USER_STATE_STORE_KEY);
// }
