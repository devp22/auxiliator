import 'dart:async';

import 'package:auxiliator/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThankYou extends StatefulWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, "/open"),
    );
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Lottie.asset("assets/thankyou.json"),
          ],
        ),
      ),
    );
  }
}
