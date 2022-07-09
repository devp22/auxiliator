// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient dp_lineargradient(
    Alignment firstPos, Alignment secondPos, Color color1, Color color2) {
  return LinearGradient(
    begin: firstPos,
    end: secondPos,
    colors: [color1, color2],
  );
}

LinearGradient dp_lineargradient_aux() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black54, Colors.black87],
  );
}

Container dp_sizedbutton(String text, Color c) {
  return Container(
    decoration: BoxDecoration(
      color: c,
      border:
          Border.all(color: Colors.black, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    height: 100,
    width: 150,
    child: Center(
      child: Text(
        text,
      ),
    ),
  );
}

Container dp_sizedbutton_aux(String text, Color c, TextStyle fs, double h,
    double w, Border border, BorderRadius br) {
  return Container(
    decoration: BoxDecoration(
      color: c,
      border: border,
      borderRadius: br,
    ),
    height: h,
    width: w,
    child: Center(
      child: Text(
        text,
        style: fs,
      ),
    ),
  );
}

Container dp_sizedbutton_helper(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white60,
      border:
          Border.all(color: Colors.white54, style: BorderStyle.solid, width: 5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    height: 100,
    width: 200,
    child: Center(
      child: Text(text,
          style: GoogleFonts.robotoCondensed(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
    ),
  );
}

Container dp_sizedbutton_login(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border:
          Border.all(color: Colors.black45, style: BorderStyle.solid, width: 5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    height: 70,
    width: 200,
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Container dp_sizedbutton_home(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.cyan.shade50,
      border:
          Border.all(color: Colors.black45, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    height: 70,
    width: 250,
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.raleway(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

TableRow dp_tablerow(String fieldname, String data, double height) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    children: [
      Column(
        children: [
          Text(
            fieldname,
            style: GoogleFonts.roboto(
              fontSize: height,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            data,
            style: GoogleFonts.roboto(
              fontSize: height,
            ),
          ),
        ],
      ),
    ],
  );
}

TableRow dp_tablerow2(String fieldname, String data) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.grey,
    ),
    children: [
      Column(
        children: [
          Text(
            fieldname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Lucidia',
              fontSize: 18,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            data,
            style: TextStyle(
              fontFamily: 'Lucidia',
              fontSize: 18,
            ),
          ),
        ],
      ),
    ],
  );
}

TextField dp_textfield(String text, IconData icon_, bool boolType,
    TextEditingController txtcontroller, TextInputType txi) {
  return TextField(
    obscureText: boolType,
    controller: txtcontroller,
    keyboardType: txi,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      labelText: text,
      prefixIcon: Icon(icon_),
    ),
  );
}

Color dp_backgroundcolor() {
  return Colors.black87;
}
