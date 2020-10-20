import 'package:flutter/material.dart';

class login_homepage extends StatefulWidget {
  @override
  _login_homepageState createState() => _login_homepageState();
}

class _login_homepageState extends State<login_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: 50,
              height: 50,
              child: Text("Icon Place Holder"),
            ),
            Container(

            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
