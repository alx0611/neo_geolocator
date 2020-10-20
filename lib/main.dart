import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gpx/gpx.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:neo_geolocator/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Home',
    home: login_homepage(),
  ));
}

class main_home extends StatefulWidget {
  @override
  _main_homeState createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  double latitudeData;
  double longtitudeData;
  Position _currentPosition;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _mapsKey = GlobalKey();
//Get location
  void getLocation() async {
    Position position =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitudeData = position.latitude;
    longtitudeData = position.longitude;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 230,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('My Geolocator'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Databases'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => db_Manager()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            key: _mapsKey,
            initialCameraPosition:
            CameraPosition(target: LatLng(21.0626, 105.7800), zoom: 15),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                  width: double.infinity,
                  height: 60,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 20,
                    child: Row(
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            icon: Icon(Icons.menu),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 13),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Search Here"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  child: FloatingActionButton(
                    child: Icon(Icons.gps_fixed),
                    onPressed: () {
                      getLocation();
                      print("Your latitude = $latitudeData");
                      print("Your longtitude = $longtitudeData");
                    },
                  ),
                )
              ])
        ],
      ),
    );
  }
}

class db_Manager extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("path")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Base Management"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        color: Colors.red,
        child: DataTable(
          columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Address")),
            DataColumn(label: Text("Telephone Number")),
            DataColumn(label: Text("Location")),
          ],
          rows:
            [
              DataCell(l)
            ]
        ),
      ),
    );
  }
}

