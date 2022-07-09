import 'dart:ffi';

import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({Key? key}) : super(key: key);

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: dp_backgroundcolor(),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                "Choose your required operation as helper",
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/createhelper"),
                child: dp_sizedbutton_helper("Create Profile"),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/viewhelper"),
                child: dp_sizedbutton_helper("View Profile"),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/updatehelper"),
                child: dp_sizedbutton_helper("Update Profile"),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/deletehelper"),
                child: dp_sizedbutton_helper("Delete Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
