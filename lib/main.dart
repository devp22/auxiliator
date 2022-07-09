import 'package:auxiliator/createhelper_screen.dart';
import 'package:auxiliator/deletehelper_screen.dart';
import 'package:auxiliator/deletehelpermain_screen.dart';
import 'package:auxiliator/doctor_screen.dart';
import 'package:auxiliator/helper_screen.dart';
import 'package:auxiliator/home_screen.dart';
import 'package:auxiliator/lawyer_screen.dart';
import 'package:auxiliator/loading_screen.dart';
import 'package:auxiliator/location_screen.dart';
import 'package:auxiliator/opening_screen.dart';
import 'package:auxiliator/police_screen.dart';
import 'package:auxiliator/profile_screen.dart';
import 'package:auxiliator/sad_screen.dart';
import 'package:auxiliator/thankyou_screen.dart';
import 'package:auxiliator/updatehelper_screen.dart';
import 'package:auxiliator/updatehelpermain_screen.dart';
import 'package:auxiliator/updateprofilepicture_screen.dart';
import 'package:auxiliator/updatesuccess_screen.dart';
import 'package:auxiliator/viewhelper_screen.dart';
import 'package:auxiliator/viewhelpermain_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const LoadingScreen(),
        "/helper": (context) => const HelperScreen(),
        "/createhelper": (context) => CreateHelper(),
        "/viewhelper": (context) => const ViewHelper(),
        "/viewhelpermain": (context) => const ViewMain(),
        "/updatehelper": (context) => const UpdateHelper(),
        "/updatehelpermain": (context) => const UpdateMain(),
        "/updatehelperpicture": (context) => const UpdatePicture(),
        "/deletehelper": (context) => const DeleteHelper(),
        "/deletehelpermain": (context) => const DeleteMain(),
        "/open": (context) => const OpeningScreen(),
        "/location": (context) => const LocationScreen(),
        "/home": (context) => const HomeScreen(),
        "/lawyer": (context) => const LawyerScreen(),
        "/police": (context) => const PoliceScreen(),
        "/doctor": (context) => const DoctorScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/thankyou": (context) => const ThankYou(),
        "/updatesuccess": (context) => const UpdateSuccess(),
        "/sadbye": (context) => const SadBye(),
      },
    );
  }
}
