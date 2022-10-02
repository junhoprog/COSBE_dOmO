import 'package:cosbe_domo/home_page/home_page.dart';
import 'package:cosbe_domo/map_page/map_function.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/login_page/main_screen.dart';
import 'package:cosbe_domo/map_page/map_page.dart';
import 'package:location/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: LoginSignupScreen(),
  ));
}