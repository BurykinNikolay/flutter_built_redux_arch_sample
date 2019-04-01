library globals;

/// Redux
import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/app_state.dart';
import 'package:yops_interview/domain/reducers/reducer_builder.dart';
import 'package:yops_interview/domain/middleware/middlewares.dart';
import 'package:yops_interview/domain/states/states.dart';
import 'package:built_redux/built_redux.dart';
import 'dart:async' show Future;

Store<AppState, AppStateBuilder, AppActions> _store;

Store<AppState, AppStateBuilder, AppActions> get store => _store;

setStore(store) => _store = store;

/// loggedIn status returned
Future<bool> initStore() async {
  var state = UserState();
  // try {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final data = prefs.getString(USER_STATE_STORE_KEY) ?? "";

  //   print('data is "${data}"');
  //   if (data.isNotEmpty) {
  //     state =
  //         serializers.deserializeWith(UserState.serializer, json.decode(data));
  //   }
  // } catch (e) {
  //   print(e.toString());
  // }

  _store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    AppState((b) => b..userState = state.toBuilder()),
    AppActions(),
  );
  // if (state.loggedIn) {
  //   _store.actions.userProfile.getProfile();
  //   _store.actions.mainScreen.getDogs();
  //   _store.actions.mainScreen.getBreeds();
  //   _store.actions.mainScreen.getFavoritesBreeds();
  //   _store.actions.colours.getColours();
  //   //TODO: Move to Screen widget logic - method is here only for testing purposes
  //   _store.actions.favoriteDogs.getFavoriteDogs();
  // }

  // emmit empty action to workaround issue when rx_built_redux emits
  // the first emitted item sometimes.
  // at least in this case it won't break our app as 'empty' does nothing :D
  // _store.actions.empty();

  /*
  _store.stream.listen((change) {
    // for debugging
    print('action ${change.action.name} dispatched and changed state');
  });
  */
  return true;
  // return state.loggedIn;
}
