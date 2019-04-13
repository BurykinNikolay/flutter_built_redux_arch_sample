// import 'package:redux_epics/redux_epics.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:rxdart/rxdart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// //collections


// Stream<dynamic> data(Stream<dynamic> actions, EpicStore<AppState> store) {
//   return new Observable(actions) // 1
//       .ofType(new TypeToken<RequestDataAction>()) // 2
//       .flatMapLatest((RequestDataAction requestAction) {
//     return getData()
//         .map((data) => new OnDataAction(data)) // 7
//         .takeUntil(
//             actions.where((action) => action is CancelRequestDataAction)); // 8
//   });
// }

// Observable<Data> getData() {
//   return Observable.zip2(Firestore.instance.collection('news').snapshots(),
//       Firestore.instance.collection('churches').snapshots(),
//       (QuerySnapshot news, QuerySnapshot churches) {
//     Map newsMap = Map();
//     news.documents.forEach((document) {
//       newsMap[document.documentID] = document.data;
//     });
//     Map churchesMap = Map();
//     churches.documents.forEach((document) {
//       churchesMap[document.documentID] = document.data;
//     });

//     Map dataFromBase = Map();
//     dataFromBase['news'] = newsMap;
//     dataFromBase['churches'] = churchesMap;

//     Data data = serializers.deserializeWith(
//         Data.serializer, json.decode(json.encode(dataFromBase)));

//     return data;
//   });

// }
