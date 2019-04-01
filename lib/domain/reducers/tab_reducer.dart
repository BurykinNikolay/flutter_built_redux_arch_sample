import 'package:built_redux/built_redux.dart';
import 'package:yops_interview/domain/actions/tab_actions.dart';
import 'package:yops_interview/domain/models/models.dart';

import 'package:yops_interview/domain/states/states.dart';

NestedReducerBuilder<AppState, AppStateBuilder, TabState, TabStateBuilder>
    createTabReducer() => new NestedReducerBuilder<AppState, AppStateBuilder,
            TabState, TabStateBuilder>(
        (state) => state.tabState, (builder) => builder.tabState)
      ..add(TabActionsNames.updateTabAction, updateTab);

void updateTab(TabState state, Action<AppTab> action, TabStateBuilder builder) {
  builder.activeTab = action.payload;
}
