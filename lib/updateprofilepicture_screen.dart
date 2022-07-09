import 'package:auxiliator/reusable_widgets.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' as File;
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'error_screen.dart';

class UpdatePicture extends StatefulWidget {
  const UpdatePicture() : super();

  @override
  State<UpdatePicture> createState() => _UpdatePictureState();
}

class _UpdatePictureState extends State<UpdatePicture> {
  late String _uploadedFileURL;
  late String field;
  late String docid;
  late String oldimageURL;
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
    docid = information["docid"];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickImage,
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: const Text(
                "Choose picture",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: uploadPicture,
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: const Text(
                "Change picture",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
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
    await FirebaseFirestore.instance
        .collection(field)
        .where("DocId", isEqualTo: docid)
        .get()
        .then((value) {
      setState(() {
        oldimageURL = value.docs.first.data()["imageURL"].toString();
      });
    });
    _storage.refFromURL(oldimageURL).delete();
    var reference = _storage.ref().child("profilepictures/${pickedFile.name}");

    var uploadTask = reference.putFile(FinalFile);
    final snapshot = await uploadTask.whenComplete(() => {});
    print("image uploaded");
    _uploadedFileURL = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection(field)
        .doc(docid)
        .update({"imageURL": _uploadedFileURL})
        .then(
          (value) => FirebaseAuth.instance.signOut().then(
                (value) => Navigator.pushNamed(context, "/updatesuccess"),
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
  }
}
