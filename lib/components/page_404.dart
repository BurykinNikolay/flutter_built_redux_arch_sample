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
            Stack(
              children: <Widget>[
                Image.asset('assets/images/banner-style02-copy-4.png'),
                Positioned(
                  left: 27,
                  bottom: 32,
                  child: Text(
                    "Сколько?\nКакой пенис?\nПутину?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: "Montserrat"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
