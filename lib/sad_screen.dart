import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SadBye extends StatefulWidget {
  const SadBye({Key? key}) : super(key: key);

  @override
  State<SadBye> createState() => _SadByeState();
}

class _SadByeState extends State<SadBye> {
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
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Lottie.asset("assets/sadtear.json"),
            Text(
              "We are thankful for your service",
              style: GoogleFonts.roboto(color: Colors.white),
            ),
            Text(
              "Hope you had a great time",
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
