import 'package:yops_interview/app/app.dart';
import 'package:flutter/material.dart';
import 'package:yops_interview/app/globals.dart' as globals;

void main() async {
  await globals.initStore();
  runApp(YopsInterviewApp());
}
