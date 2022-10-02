import 'package:cosbe_domo/chatbot_page/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:cosbe_domo/chatbot_page/chat.dart';

class my_page extends StatelessWidget {
  const my_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 10),
                          child: Text("이동율님 환영합니다."))),
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
                                    "Lv1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text("70%",
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
                                    MediaQuery.of(context).size.width / 10 * 5,
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
                                        builder: (context) => ChatBot()));
                              },
                            ),
                            Text("챗봇"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.currency_bitcoin,
                              size: MediaQuery.of(context).size.width / 5,
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
                            Icon(
                              Icons.photo_album_outlined,
                              size: MediaQuery.of(context).size.width / 5,
                            ),
                            Text("앨범 제작"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 10),
                          child: Text(
                            "서비스 설정",
                            style: TextStyle(color: Colors.grey),
                          ))),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 40,
                            ),
                            Text(
                              "설정",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 30, color: Colors.grey),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                            ),
                            Text(
                              "내 정보",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 30, color: Colors.grey),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.dark_mode_outlined,
                              size: 40,
                            ),
                            Text(
                              "다크모드",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 30, color: Colors.grey),
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
