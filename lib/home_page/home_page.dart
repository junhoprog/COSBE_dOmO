import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/home_page/home_variable.dart';
import 'package:cosbe_domo/information_page/recommend_page.dart';
import 'package:cosbe_domo/map_page/map_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:cosbe_domo/map_page/map_function.dart';
import '../my_page/my_page.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  List level_exp = [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];

  @override
  void initState(){
    get_Infor();
  }


  @override
  Widget build(BuildContext context) {
    get_Infor();
    location.onLocationChanged.listen((l) async {
        initLocationService(location);
        marker_search();
      }
    );
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/10*4,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff656CFF),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/20),
                      Text("dOmO",style: TextStyle(color: Colors.white,fontSize: 30),),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),
                        width: MediaQuery.of(context).size.width/100*85,
                        height: MediaQuery.of(context).size.height/10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(width: 0.7)
                        ),
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
                                      Text("Lv${level}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                Text("${exp / level_exp[level-1] * 100}%",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height/50,
                                  width: MediaQuery.of(context).size.width/10*8,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.7),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/50,
                                  width: MediaQuery.of(context).size.width/10*8*(exp/level_exp[level-1]),
                                  decoration: BoxDecoration(
                                      color: Color(0xff656CFF),
                                      border: Border.all(width: 0.7),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height/20,
                  right:  MediaQuery.of(context).size.width/100*8,
                  child: Container(
                    width: MediaQuery.of(context).size.width/10*2,
                    height: MediaQuery.of(context).size.height/15,
                    child:MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>map_page())
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.my_location,color: Colors.black,size: 15),
                                Text(" 내 위치",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,height: 1),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height/100*65,
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                          Container(child: Row(
                            children: [
                              Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                              Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Text("색다른 추천 여행지",style: TextStyle(fontWeight: FontWeight.w900),)), ),
                              Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                            ],
                          )), //루트 추천
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            child: Container(
                                height: MediaQuery.of(context).size.height/4,
                                width: MediaQuery.of(context).size.width/10*8,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/home_assets/hwanggan.jpg",fit: BoxFit.fill,
                                        height: MediaQuery.of(context).size.height/4,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(alignment: Alignment.topRight,child: Icon(Icons.filter_9_plus),),
                                          SizedBox(height: MediaQuery.of(context).size.height/20,),
                                          Container(
                                            width: 50,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("1박2일",style: TextStyle(color: Colors.white,fontSize: 12),),),
                                          ),
                                          Text("영동 풍경 즐기기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on_outlined,color: Colors.white,),
                                                    Text("충청북도",style: TextStyle(color: Colors.white),)
                                                  ],
                                                ),
                                              ),
                                              Text("Lv4",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=> recommend_page())
                              );
                            },
                          ),//루트추천 컨테이너
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                          Container(
                              child: Row(
                                children: [
                                  Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                                  Flexible(flex:8,
                                      child:Container(
                                        height: MediaQuery.of(context).size.height/15,
                                        child:MaterialButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: (){

                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Color(0xff656CFF),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("+다른 여행지 보기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,height: 1),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                  Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                                ],
                              )),
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                          Container(child: Row(
                            children: [
                              Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                              Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Text("dOmO 사용법",style: TextStyle(fontWeight: FontWeight.w900),)), ),
                              Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                            ],
                          )),
                          SizedBox(height: MediaQuery.of(context).size.height/60),
                          Container(child: Row(
                            children: [
                              Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                              Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Divider(thickness: 2,color: Colors.grey[400],))),
                              Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                            ],
                          )),
                          SizedBox(height: MediaQuery.of(context).size.height/60),
                          Container(
                            width: MediaQuery.of(context).size.width/10*8,
                            height: MediaQuery.of(context).size.height/10*4,
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/home_assets/one.png",width: 40,),
                                          SizedBox(width: MediaQuery.of(context).size.width/100*5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("dOmO와 함께 여행을 즐겨보세요!",style: TextStyle(fontSize: 12),),
                                              Text("여행지를 정하고 여행을 하면,",style: TextStyle(fontSize: 12),),
                                              Text("dOmO가 활성화를 시켜줍니다!",style: TextStyle(fontSize: 12),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Image.asset("assets/home_assets/manual_one.png",height: MediaQuery.of(context).size.height/4,),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/home_assets/two.png",width: 40,),
                                          SizedBox(width: MediaQuery.of(context).size.width/100*5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("활성화가 되었나요?",style: TextStyle(fontSize: 12),),
                                              Text("바로 도감에 등록해보세요!",style: TextStyle(fontSize: 12),),
                                              Text("도감에 사진과 글을 등록하실 수 있습니다!",style: TextStyle(fontSize: 12),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Image.asset("assets/home_assets/manual_two.png",height: MediaQuery.of(context).size.height/4,),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/home_assets/three.png",width: 40,),
                                          SizedBox(width: MediaQuery.of(context).size.width/100*5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("dOmO가 여행을 도와드립니다!",style: TextStyle(fontSize: 12),),
                                              Text("추천여행지로 좋지만 소외된 지역을 알리고,",style: TextStyle(fontSize: 12),),
                                              Text("챗봇으로 여러 정보를 얻을 수 있습니다!",style: TextStyle(fontSize: 12),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Image.asset("assets/home_assets/manual_three.png",height: MediaQuery.of(context).size.height/4,),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottom_bar(),
      ),
    );
  }
}
