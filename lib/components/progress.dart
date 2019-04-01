
import 'package:flutter/material.dart';

var _defaultBackgroundColor = Colors.black.withOpacity(0.5);

class Progress extends StatelessWidget {

  final Color background;

  Progress({
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? _defaultBackgroundColor,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        value: null,
      ),
    );
  }
}