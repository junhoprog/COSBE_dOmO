import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/map_page/map_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_page/main_screen.dart';

class loading_page extends StatefulWidget {
  const loading_page({Key? key}) : super(key: key);

  @override
  State<loading_page> createState() => _loading_pageState();
}

class _loading_pageState extends State<loading_page> {
  @override
  void initState() {
    add_marker();
    Timer(Duration(milliseconds: 5000), () {
      add_marker_map();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginSignupScreen()
      )
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final String imageLogoName = 'assets/logo/domo_logo.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor:1.0),
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: new Container(
            //height : MediaQuery.of(context).size.height,
            //color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.384375),
                Container(
                  child: Image.asset(
                    imageLogoName,
                    width: screenWidth * 0.716666,
                    height: screenHeight * 0.259375,
                  ),
                ),
                Expanded(child: SizedBox()),
                Align(
                  child: Text("© Copyright 2022, dOmO",
                      style: TextStyle(
                        fontSize: screenWidth*( 14/360), color: Color.fromRGBO(255, 255, 255, 0.6),)
                  ),
                ),
                SizedBox( height: MediaQuery.of(context).size.height*0.0625,),
              ],
            ),

          ),
        ),
      ),
    );
  }
}