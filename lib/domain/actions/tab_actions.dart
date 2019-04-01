import 'package:built_redux/built_redux.dart';
import 'package:yops_interview/domain/models/models.dart';
part 'tab_actions.g.dart';

abstract class TabActions extends ReduxActions {
  TabActions._();

  ActionDispatcher<AppTab> get updateTabAction;

  factory TabActions() => new _$TabActions();
}
