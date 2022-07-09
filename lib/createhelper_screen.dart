// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, library_prefixes

import 'dart:io' as File;

import 'package:auxiliator/error_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'reusable_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateHelper extends StatefulWidget {
  CreateHelper({Key? key}) : super(key: key);

  @override
  State<CreateHelper> createState() => _CreateHelperState();
}

class _CreateHelperState extends State<CreateHelper> {
  var status = Permission.photos.status;

  @override
  void initState() {
    super.initState();
    var requestStatus = Permission.photos.request();
    if (requestStatus == status.isDenied) {
      super.dispose();
      Navigator.pushNamed(context, "/helper");
    }
  }

  void dispose() {
    super.dispose();
  }

  String dropdownvalue = 'Lawyer';
  String collectionname = 'Lawyers';
  var items = ['Lawyer', 'Doctor', 'Policeman'];
  // late File? _image;
  late String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    TextEditingController fnameController = TextEditingController();
    TextEditingController lnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController languageController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController experienceController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter your details",
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: pickImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                child: Text(
                  "Choose a picture for your profile:",
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black87, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
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
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your first name:", Icons.abc, false,
                    fnameController, TextInputType.name),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your last name:", Icons.abc, false,
                    lnameController, TextInputType.name),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your e-mail id", Icons.email, false,
                    emailController, TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your contact number:", Icons.numbers,
                    false, contactController, TextInputType.number),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield(
                    "Enter your experience (in years):",
                    Icons.av_timer_rounded,
                    false,
                    experienceController,
                    TextInputType.number),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield(
                    "Enter your language (you can add multiple languages by adding '/' in end):",
                    Icons.spatial_audio_off_rounded,
                    false,
                    languageController,
                    TextInputType.text),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your address:", Icons.house, false,
                    addressController, TextInputType.streetAddress),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your city:", Icons.location_city,
                    false, cityController, TextInputType.text),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: dp_textfield("Enter your password:", Icons.password,
                    true, passwordController, TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 50,
              ),
              // ElevatedButton(
              //   onPressed: uploadImage,
              //   child: const Text("upload photo"),
              // ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) => print("User added successfully"))
                      .then((value) => uploadPicture())
                      .onError(
                        (error, stackTrace) => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ErrorScreen(
                              errorMessage: error.toString(),
                            ),
                          ),
                        ),
                      );
                  if (dropdownvalue == "Lawyer") {
                    collectionname = "Lawyers";
                  } else if (dropdownvalue == "Doctor") {
                    collectionname = "Doctors";
                  } else {
                    collectionname = "Policemen";
                  }
                  CollectionReference helpers =
                      FirebaseFirestore.instance.collection(collectionname);
                  String userId =
                      FirebaseAuth.instance.currentUser!.uid.toString();

                  await helpers
                      .add({
                        "First Name": fnameController.text,
                        "Last Name": lnameController.text,
                        "E-Mail ID": emailController.text,
                        "Contact Number": contactController.text,
                        "Password": passwordController.text,
                        "Address": addressController.text,
                        "Experience": experienceController.text,
                        "Language": languageController.text,
                        "City": cityController.text,
                        "UserId": userId == "" ? "" : userId,
                        "imageURL": _uploadedFileURL
                      })
                      .then((value) =>
                          helpers.doc(value.id).update({"DocId": value.id}))
                      .then(
                          (value) => Navigator.pushNamed(context, "/thankyou"))
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
                child: dp_sizedbutton_login("Create Helper"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  late XFile _imageFile;
  final picker = ImagePicker();
  late final pickedFile;
  late final FinalFile;
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future pickImage() async {
    pickedFile = (await picker.pickImage(source: ImageSource.gallery));
    _imageFile = pickedFile;
    FinalFile = File.File(_imageFile.path);
  }

  void uploadPicture() async {
    var reference = _storage.ref().child("profilepictures/${pickedFile.name}");
    var uploadTask = reference.putFile(FinalFile);
    final snapshot = await uploadTask.whenComplete(() => {});
    print("image uploaded");
    _uploadedFileURL = await snapshot.ref.getDownloadURL();
  }
}
