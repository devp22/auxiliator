import 'package:auxiliator/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class UpdateSuccess extends StatefulWidget {
  const UpdateSuccess({Key? key}) : super(key: key);

  @override
  State<UpdateSuccess> createState() => _UpdateSuccessState();
}

class _UpdateSuccessState extends State<UpdateSuccess> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Lottie.asset("assets/updatesuccess.json"),
            Text(
              "Your details have been successfully updated",
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
