import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yops_interview/domain/models/app_tab.dart';

part 'tab_state.g.dart';

abstract class TabState implements Built<TabState, TabStateBuilder> {
  AppTab get activeTab;

  TabState._();

  factory TabState([updates(TabStateBuilder b)]) => new _$TabState((b) => b
    ..activeTab = AppTab.main
    ..update(updates));

  static Serializer<TabState> get serializer => _$tabStateSerializer;
}
