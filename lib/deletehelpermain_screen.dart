import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:auxiliator/error_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' as File;
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'error_screen.dart';

class DeleteMain extends StatefulWidget {
  const DeleteMain({Key? key}) : super(key: key);

  @override
  State<DeleteMain> createState() => _DeleteMainState();
}

class _DeleteMainState extends State<DeleteMain> {
  late String field;
  late String? DocId = "sgsgsg";
  late String _uploadedFileURL;
  late String docid;
  late String oldimageURL;
  String dropdownvalue = 'First Name';
  TextInputType keyboardtype = TextInputType.text;
  // List of items in our dropdown menu

  String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  void getDocId() async {
    var firestoreInstance = await FirebaseFirestore.instance
        .collection(field)
        .where("UserId", isEqualTo: userId)
        .get()
        .then((value) {
      setState(() {
        DocId = value.docs.first.data()["DocId"];
        oldimageURL = value.docs.first.data()["imageURL"];
      });
    });
    print("DOCID1: $DocId");
  }

  @override
  Widget build(BuildContext context) {
    Map information = ModalRoute.of(context)?.settings.arguments as Map;
    field = information["field"];
    TextEditingController _newvalue = TextEditingController();
    getDocId();
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Text(
                "We are thankful for your service ;)",
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              GestureDetector(
                onTap: () async {
                  print("USERID: $userId");
                  print("DOCID2: $DocId");
                  // print("NEW VALUE IS ${_newvalue.value}");
                  FirebaseAuth.instance.currentUser?.delete().then((value) =>
                      (FirebaseStorage.instance
                          .refFromURL(oldimageURL)
                          .delete()));

                  FirebaseFirestore.instance
                      .collection(field)
                      .doc(DocId)
                      .delete()
                      .then(
                        (value) => Navigator.pushNamed(context, "/sadbye"),
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
                child: dp_sizedbutton_login("Delete Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FirebaseStorage _storage = FirebaseStorage.instance;

  void deletepicture() async {
    await FirebaseFirestore.instance
        .collection(field)
        .where("DocId", isEqualTo: docid)
        .get()
        .then((value) {
      setState(() {
        oldimageURL = value.docs.first.data()["imageURL"].toString();
      });
    });
    FirebaseStorage.instance.refFromURL(oldimageURL).delete();
  }
}
