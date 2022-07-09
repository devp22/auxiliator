import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable_widgets.dart';

class LawyerScreen extends StatefulWidget {
  const LawyerScreen({Key? key}) : super(key: key);

  @override
  State<LawyerScreen> createState() => _LawyerScreenState();
}

class _LawyerScreenState extends State<LawyerScreen> {
  late String cityName;
  final db = FirebaseFirestore.instance;
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
    cityName = information["city"];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('Lawyers')
              // .where("City", isEqualTo: cityName)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/profile", arguments: {
                      "First Name": doc['First Name'],
                      "Last Name": doc['Last Name'],
                      "Address": doc['Address'],
                      "City": doc['City'],
                      "Experience": doc['Experience'],
                      "Contact Number": doc['Contact Number'],
                      "E-Mail ID": doc['E-Mail ID'],
                      "imageURL": doc['imageURL'],
                    }),
                    child: Card(
                      child: ListTile(
                        tileColor: Colors.cyan.shade50,
                        title: Text(
                          "${doc['First Name']} ${doc['Last Name']}",
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          doc['Address'],
                          style: GoogleFonts.ubuntu(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
