import 'package:cosbe_domo/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/login_page/main_screen.dart';
import 'package:cosbe_domo/map_page/map_page.dart';
import 'package:location/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initlocation();
  runApp(MaterialApp(
    home: LoginSignupScreen(),
  ));
}

Future _initlocation() async{
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Location location = new Location();

  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) {
      return;
    }
  }

  var permission = await location.hasPermission();
  if (permission == PermissionStatus.denied) {
    permission = await location.requestPermission();
    if (permission != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
  current_latitude=_locationData.latitude!;
  current_longitude=_locationData.longitude!;
}
