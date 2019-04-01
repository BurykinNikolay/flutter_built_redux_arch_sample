library app_tab;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yops_interview/app/icons.dart';
import 'package:flutter/material.dart';

part 'app_tab.g.dart';

class AppTab extends EnumClass {
  static Serializer<AppTab> get serializer => _$appTabSerializer;

  static const AppTab main = _$main;
  static const AppTab favorite = _$favorite;
  static const AppTab answers = _$answers;
  static const AppTab profile = _$profile;

  const AppTab._(String name) : super(name);

  static BuiltSet<AppTab> get values => _$appTabValues;

  static AppTab valueOf(String name) => _$appTabValueOf(name);

  static AppTab fromIndex(int index) {
    switch (index) {
      case 0:
        return AppTab.main;
      case 1:
        return AppTab.favorite;
      case 2:
        return AppTab.answers;
      case 3:
        return AppTab.profile;
      default:
        return AppTab.main;
    }
  }

  static int toIndex(AppTab tab) {
    switch (tab) {
      case AppTab.main:
        return 0;
      case AppTab.favorite:
        return 1;
      case AppTab.answers:
        return 2;
      case AppTab.profile:
        return 3;
      default:
        return 0;
    }
  }
}
