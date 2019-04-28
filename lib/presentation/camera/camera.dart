import 'package:flutter/material.dart';

import 'camera_container.dart';

class Camera extends StatelessWidget {
  final Function() next;
  Camera({this.next});

  @override
  Widget build(BuildContext context) {
    return CameraContainer(
      next: next,
    );
  }
}
