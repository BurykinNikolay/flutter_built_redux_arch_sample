import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';
import 'package:yops_interview/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

typedef ViewModelBuilder<ViewModel> = Function(
    BuildContext context, ViewModel vm);

class ActiveTab extends StoreConnector<AppState, AppActions, AppTab> {
  final ViewModelBuilder<AppTab> builder;

  ActiveTab({Key key, @required this.builder}) : super(key: key);

  @override
  AppTab connect(AppState state) => state.tabState.activeTab;

  @override
  Widget build(BuildContext context, AppTab activeTab, AppActions actions) {
    return builder(context, activeTab);
  }
}
