import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'place.dart';

class Action {
  var points;
  final _dbRef = FirebaseDatabase.instance.reference().child("places");

  Future<void> getCurrentPosition() async {
    var data = await _dbRef.once();
    this.points = Place.fromSnapshot(data.value);
  }

  Future<void> addCurrentPosition(
      String address, GoogleMap location, String name, String telephone) async {
    _dbRef.push().set({
      "address": address,
      "location": location,
      "name": name,
      "telephone": telephone
    }).then((_) {
      print("Them thanh cong");
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> updateCurrentPosition(Place place) async {
    if (place.id != null) {
      await _dbRef.child(place.id).set(place.toJson());
    }
  }

  Future<void> deleteCurrentPosition(Place place) async {
    if (place.id != null) {
      await _dbRef.child(place.id).remove().then((_) {
        print("Xoa thanh cong");
        getCurrentPosition();
      }).catchError((onError) {
        print(onError);
      });
    }
  }
}
