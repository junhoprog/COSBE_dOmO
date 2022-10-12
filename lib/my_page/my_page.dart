import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cosbe_domo/login_page/main_screen.dart';
import 'package:cosbe_domo/chatbot_page/chatbot.dart';
String name = "";
int level = 2;
int exp = 10;
final firestore=FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

Future get_Infor()async{
  var result=await firestore
      .collection('${auth.currentUser?.uid}')
      .doc('유저정보').get();
  level=int.parse(result['level']);
  exp=int.parse(result['exp']);
  name=result['name'];
}

class my_page extends StatelessWidget {
  static final storage = FlutterSecureStorage();
  my_page({Key? key}) : super(key: key);

  List level_exp = [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];

  @override
  void initState(){
    get_Infor();
  }

  @override
  Widget build(BuildContext context) {
    get_Infor();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "dOmO",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10,right:MediaQuery.of(context).size.width / 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text("${name}님 환영합니다.")
                        ),
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Color(0xff656CFF),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                              onPressed: (){
                                storage.delete(key: "login");
                                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginSignupScreen()));
                              },
                            child: Text("로그아웃",style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 0.7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.leaderboard),
                                  Text(
                                    "Lv${level}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text("${exp / level_exp[level - 1] * 100}%",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 50,
                                width:
                                    MediaQuery.of(context).size.width / 10 * 8,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.7),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 50,
                                width:
                                    MediaQuery.of(context).size.width / 10 * 8 * (exp / level_exp[level - 1]),
                                decoration: BoxDecoration(
                                    color: Color(0xff656CFF),
                                    border: Border.all(width: 0.7),
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40,
                        bottom: MediaQuery.of(context).size.height / 40),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/mypage_assets/bot.png"),
                              iconSize: MediaQuery.of(context).size.width / 5,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatBot()
                                    )
                                );
                              },
                            ),
                            Text("챗봇"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: MediaQuery.of(context).size.width / 5,
                              onPressed: (){
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // user must tap button!
                                  builder: (
                                      BuildContext context) {
                                    return AlertDialog(
                                      title: Text("포인트샵"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            Text('아직 포인트샵이 준비중입니다!'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('네'),
                                          onPressed: () {
                                            Navigator.of(
                                                context)
                                                .pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.currency_bitcoin,
                                size: MediaQuery.of(context).size.width / 5,
                              ),
                            ),
                            Row(
                              children: [
                                Text("포인트 "),
                                Text(
                                  "610",
                                  style: TextStyle(color: Colors.redAccent),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: MediaQuery.of(context).size.width / 5,
                              onPressed: (){
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // user must tap button!
                                  builder: (
                                      BuildContext context) {
                                    return AlertDialog(
                                      title: Text("앨범 제작"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            Text('아직 앨범 제작이 준비중입니다!'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('네'),
                                          onPressed: () {
                                            Navigator.of(
                                                context)
                                                .pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.photo_album_outlined,
                                size: MediaQuery.of(context).size.width / 5,
                              ),
                            ),
                            Row(
                              children: [
                                Text("앨범 제작"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottom_bar(),
      ),
    );
  }
}
