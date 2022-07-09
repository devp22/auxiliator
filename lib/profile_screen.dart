import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    Map information = ModalRoute.of(context)?.settings.arguments as Map;
    image = information["imageURL"];
    firstName = information["First Name"];
    lastName = information["Last Name"];
    address = information["Address"];
    city = information["City"];
    email = information["E-Mail ID"];
    contact = information["Contact Number"];
    experience = information["Experience"];
    var url = Uri.parse("sms:${contact}");

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: dp_lineargradient(Alignment.topCenter,
              Alignment.bottomCenter, Colors.black54, Colors.black87),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 5,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () =>
                          FlutterPhoneDirectCaller.callNumber(contact),
                      child: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () => launchUrl(url),
                      child: Icon(
                        Icons.message,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                  defaultColumnWidth: FixedColumnWidth(
                      MediaQuery.of(context).size.width * 0.45),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    dp_tablerow2("First Name", firstName),
                    dp_tablerow2("Last Name", lastName),
                    dp_tablerow2("E-Mail Address", email),
                    dp_tablerow2("Contact", contact),
                    dp_tablerow2("Experience", "${experience} years"),
                    dp_tablerow2("Address", address),
                    dp_tablerow2("City", city),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
