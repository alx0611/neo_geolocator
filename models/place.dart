import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Place {
  String _id;
  String _address;
  GeoPoint _location;
  String _name;
  String _telephone;

  Place(
      {@required String id,
      @required String address,
      @required GeoPoint location,
      @required String name,
      @required String telephone}) {
    this._id = id;
    this._address = address;
    this._location = location;
    this._name = name;
    this._telephone = telephone;
  }

  String get id => this._id;
  String get address => this._address;
  GeoPoint get location => this._location;
  String get name => this._name;
  String get telephone => this._telephone;

  Place.fromSnapshot(DataSnapshot snapshot) {
    this._id = snapshot.key;
    this._address = snapshot.value['address'];
    this._location = snapshot.value['location'];
    this._name = snapshot.value['name'];
    this._telephone = snapshot.value['telephone'];
  }

  toJson() {
    return {
      "address": address,
      "location": location,
      "name": name,
      "telephone": telephone
    };
  }
}
