import 'dart:developer';
import 'package:cosbe_domo/home_page/home_variable.dart';
import 'package:cosbe_domo/information_page/recommend_page.dart';
import 'package:flutter/material.dart';
import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
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
                    width: MediaQuery.of(context).size.width/10*8,
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
                                  Text("Lv1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Text("70%",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                              width: MediaQuery.of(context).size.width/10*5,
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
                              Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Text("진행중인 도감",style: TextStyle(fontWeight: FontWeight.w900),)), ),
                              Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                            ],
                          )), //진행중인 도감
                          SizedBox(height: MediaQuery.of(context).size.height/30),
                          Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                                controller: proceeding_dogam_controller,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context,int index){
                                  return Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            "assets/home_assets/sangdang.jpg",fit: BoxFit.fill,
                                            height: MediaQuery.of(context).size.height/4,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height/4,
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("청주",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
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
                                                  Text("3/19",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  );
                                }
                            ),
                          ), //진행중인 도감 컨테이너
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
                                          onPressed: (){},
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Color(0xff656CFF),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("+도감 더 채우러 가기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,height: 1),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                  Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                                ],
                              )), // 도감 더 채우러가기
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
