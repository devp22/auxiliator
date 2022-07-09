import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:auxiliator/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
    exit(0);
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
            const SizedBox(
              height: 70,
            ),
            Text(
              "Welcome to auxiliator",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Lottie.asset(
              'assets/helping_humans.json',
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/helper"),
              child: dp_sizedbutton_aux(
                "Join as helper",
                Colors.grey,
                GoogleFonts.raleway(fontWeight: FontWeight.bold),
                100.0,
                200.0,
                Border.all(
                    color: Colors.black45, style: BorderStyle.solid, width: 5),
                BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/location"),
              child: dp_sizedbutton_aux(
                "Join as seeker",
                Colors.grey,
                GoogleFonts.raleway(fontWeight: FontWeight.bold),
                100.0,
                200.0,
                Border.all(
                    color: Colors.black45, style: BorderStyle.solid, width: 5),
                BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
