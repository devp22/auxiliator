import 'dart:ffi';

import 'package:auxiliator/error_screen.dart';
import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateHelper extends StatefulWidget {
  const UpdateHelper({Key? key}) : super(key: key);

  @override
  State<UpdateHelper> createState() => _UpdateHelperState();
}

class _UpdateHelperState extends State<UpdateHelper> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  String dropdownvalue = 'Lawyers';
  var items = ['Lawyers', 'Doctors', 'Policemen'];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: dp_backgroundcolor(),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.225,
                ),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.work,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Choose your profession",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                      DropdownButton(
                        value: dropdownvalue,
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            var currentFocus = FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                dp_textfield("Enter your mail id", Icons.search, false,
                    _emailController, TextInputType.emailAddress),
                const SizedBox(
                  height: 50,
                ),
                dp_textfield("Enter your password", Icons.password, true,
                    _passwordController, TextInputType.emailAddress),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) => Navigator.pushNamed(
                            context, "/updatehelpermain",
                            arguments: {"field": dropdownvalue}))
                        .onError(
                          (error, stackTrace) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ErrorScreen(
                                errorMessage: error.toString(),
                              ),
                            ),
                          ),
                        );
                  },
                  child: dp_sizedbutton_login("Sign In"),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )),
      ),
    );
  }
}
