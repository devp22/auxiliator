import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 6),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/help.png"),
              ),
              const SizedBox(
                height: 150,
              ),
              Lottie.asset(
                'assets/panda_operator.json',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(
                height: 50,
              ),
              Text("Made with love",
                  style: GoogleFonts.inconsolata(color: Colors.white)),
            ],
          )),
    );
  }
}
