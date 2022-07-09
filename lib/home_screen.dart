import 'package:flutter/material.dart';
import 'package:auxiliator/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  // final double latitude;
  // final double longitude;
  // final String? country;
  // final String? city;
  // // final String locality;
  // final String? sublocality;
  const HomeScreen() : super();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double latitude;
  late double longitude;
  late String? country;
  late String? city;
  late String? sublocality;
  late String? featureName;
  late String? adminArea;
  late String? subAdminArea;
  late String? street;
  @override
  Widget build(BuildContext context) {
    double tablefontsize = MediaQuery.of(context).size.height * 0.018;
    void initState() {
      super.initState();
    }

    void dispose() {
      super.dispose();
    }

    Map information = ModalRoute.of(context)?.settings.arguments as Map;
    latitude = information["latitude"];
    longitude = information["longitude"];
    country = information["country"];
    city = information["city"];
    sublocality = information["sublocality"];
    street = information["street"];
    featureName = information["feature name"];
    adminArea = information["administrative area"];
    subAdminArea = information["subadministrative area"];
    String cityName = city.toString();
    String countryName = country.toString();
    String sublocalityName = sublocality.toString();
    String streetname = street.toString();
    String _featureName = featureName.toString();
    String adminAreaName = adminArea.toString();
    String subAdminAreaName = subAdminArea.toString();

    // String cityName = "aavav";
    // String countryName = "ascavav";
    // String sublocalityName = "Aasfbfbd";
    // String streetname = "efwfgsd";
    // String _featureName = "hfnbnfn";
    // String adminAreaName = "ewrwtg";
    // String subAdminAreaName = "fdbdgngn";
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: dp_backgroundcolor(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Table(
              defaultColumnWidth:
                  FixedColumnWidth(MediaQuery.of(context).size.width * 0.45),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: [
                dp_tablerow("Country", countryName, tablefontsize),
                dp_tablerow(
                    "Administrative Area", adminAreaName, tablefontsize),
                dp_tablerow(
                    "Sub Administrative Area", subAdminAreaName, tablefontsize),
                dp_tablerow("Locality", cityName, tablefontsize),
                dp_tablerow("SubLocality", sublocalityName, tablefontsize),
                dp_tablerow("Feature Name", _featureName, tablefontsize),
                dp_tablerow("Street Name", streetname, tablefontsize),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: dp_sizedbutton_home("Contact Lawyers"),
              onTap: () => Navigator.pushNamed(context, "/lawyer",
                  arguments: {"city": cityName}),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: dp_sizedbutton_home("Contact Doctors"),
              onTap: () => Navigator.pushNamed(context, "/doctor",
                  arguments: {"city": cityName}),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: dp_sizedbutton_home("Contact Police"),
              onTap: () => Navigator.pushNamed(context, "/police",
                  arguments: {"city": cityName}),
            ),
          ],
        ),
      ),
    );
  }
}
