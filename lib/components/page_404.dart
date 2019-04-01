import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  Page404();

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/404.jpg'),
            Text('404. Sorry, it is construction site here'),
          ],
        ),
      ),
    );
  }
}
