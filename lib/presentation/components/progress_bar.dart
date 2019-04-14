import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65, width: 157, child: CircularProgressIndicator()); // Center(
  }
}

class ProgressBarShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            padding: EdgeInsets.all(10),
            child: ProgressBar()));
  }
}
