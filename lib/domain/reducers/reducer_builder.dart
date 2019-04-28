import 'package:built_redux/built_redux.dart';
import 'package:yops_interview/domain/reducers/reducers.dart';

import 'package:yops_interview/domain/states/states.dart';

var reducerBuilder = new ReducerBuilder<AppState, AppStateBuilder>()
  ..combineNested(createTabReducer())
  ..combineNested(createCameraReducer())
  ..combineNested(createInterviewReducer())
  ..combineNested(createQuestionsReducer());

var reducers = reducerBuilder.build();
