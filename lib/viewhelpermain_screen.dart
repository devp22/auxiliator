import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewMain extends StatefulWidget {
  const ViewMain({Key? key}) : super(key: key);

  @override
  State<ViewMain> createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> {
  String address = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String contact = "";
  String city = "";
  String experience = "";
  String image = "";
  late String field;
  late String docId;
  String userId = FirebaseAuth.instance.currentUser!.uid.toString();

  void getDocId() async {
    var firestoreInstance = await FirebaseFirestore.instance
        .collection(field)
        .where("UserId", isEqualTo: userId)
        .get()
        .then((value) {
      setState(() {
        docId = value.docs.first.data()["DocId"];
        image = value.docs.first.data()["imageURL"];
        firstName = value.docs.first.data()["First Name"];
        lastName = value.docs.first.data()["Last Name"];
        address = value.docs.first.data()["Address"];
        city = value.docs.first.data()["City"];
        email = value.docs.first.data()["E-Mail ID"];
        contact = value.docs.first.data()["Contact Number"];
        experience = value.docs.first.data()["Experience"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double tablefontsize = MediaQuery.of(context).size.height * 0.018;
    Map information = ModalRoute.of(context)?.settings.arguments as Map;
    field = information["field"];
    getDocId();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Your Profile",
                      style: GoogleFonts.josefinSans(
                        fontSize: 30,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 5,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                  defaultColumnWidth: FixedColumnWidth(
                      MediaQuery.of(context).size.width * 0.45),
                  border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  children: [
                    dp_tablerow("First Name", firstName, tablefontsize),
                    dp_tablerow("Last Name", lastName, tablefontsize),
                    dp_tablerow("E-Mail Address", email, tablefontsize),
                    dp_tablerow("Contact", contact, tablefontsize),
                    dp_tablerow(
                        "Experience", "${experience} years", tablefontsize),
                    dp_tablerow("Address", address, tablefontsize),
                    dp_tablerow("City", city, tablefontsize),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () => {
                    FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.pushNamed(context, "/open"),
                        ),
                  },
                  child: dp_sizedbutton_login("Sign Out"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
