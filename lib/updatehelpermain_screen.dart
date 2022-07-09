// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:auxiliator/error_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

late String field;

class UpdateMain extends StatefulWidget {
  const UpdateMain() : super();

  @override
  State<UpdateMain> createState() => _UpdateMainState();
}

class _UpdateMainState extends State<UpdateMain> {
  late String? field;
  late String? DocId = "sgsgsg";

  String dropdownvalue = 'First Name';
  TextInputType keyboardtype = TextInputType.text;
  // List of items in our dropdown menu
  var items = [
    'First Name',
    'Last Name',
    'E-Mail ID',
    'Contact Number',
    'Language',
    'Experience',
    'City',
    'Address',
    'Password'
  ];
  String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  void getDocId() async {
    var firestoreInstance = await FirebaseFirestore.instance
        .collection(field!)
        .where("UserId", isEqualTo: userId)
        .get()
        .then((value) => DocId = value.docs.first.data()["DocId"]);
    print("DOCID1: $DocId");
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    void dispose() {
      super.dispose();
    }

    Map information = ModalRoute.of(context)?.settings.arguments as Map;
    field = information["field"];
    TextEditingController _newvalue = TextEditingController();
    getDocId();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: dp_backgroundcolor(),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Text(
                "Choose the field you want field:",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              DropdownButton(
                value: dropdownvalue,
                iconEnabledColor: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down),

                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    if (dropdownvalue == "Contact Number" ||
                        dropdownvalue == "Experience") {
                      keyboardtype = TextInputType.number;
                    } else if (dropdownvalue == "E-Mail ID" ||
                        dropdownvalue == "Password") {
                      keyboardtype = TextInputType.emailAddress;
                    } else {
                      keyboardtype = TextInputType.text;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              dp_textfield(
                  "Enter new value", Icons.aod, false, _newvalue, keyboardtype),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context, "/updatehelperpicture",
                    arguments: {"field": field, "docid": DocId}),
                child: Text("To Update Profile Picture, Click here"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              GestureDetector(
                onTap: () async {
                  print("USERID: $userId");
                  print("DOCID2: $DocId");
                  // print("NEW VALUE IS ${_newvalue.value}");
                  if (dropdownvalue == "Password") {
                    FirebaseAuth.instance.currentUser
                        ?.updatePassword(_newvalue.text.toString());
                  }
                  FirebaseFirestore.instance
                      .collection(field!)
                      .doc(DocId)
                      .update({dropdownvalue: _newvalue.text.toString()})
                      .then(
                        (value) => FirebaseAuth.instance.signOut().then(
                              (value) => Navigator.pushNamed(
                                  context, "/updatesuccess"),
                            ),
                      )
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
                child: dp_sizedbutton_login("Change Value"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.106,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
