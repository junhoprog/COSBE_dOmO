import 'dart:developer';

import 'package:cosbe_domo/home_page/home_variable.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("dOmO",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
          actions: [
            Icon(Icons.account_circle,size: 50,color: Colors.blue,)
          ],
        ),
        body: ListView(
          children: [
            Column(
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
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: proceeding_dogam_controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(width: 1,color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/home_assets/sangdang.jpg",fit: BoxFit.fill,
                                height: MediaQuery.of(context).size.height/4,
                                width: MediaQuery.of(context).size.width/10*8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("청주",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                  Text("3/19",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                ],
                              )
                            ],
                          ),
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
                        height: 50,
                        child:MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){},
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff8958F1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("+도감 더 채우러 가기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,height: 1),),
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
                    Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Text("이런곳은 어떠신가요?",style: TextStyle(fontWeight: FontWeight.w900),)), ),
                    Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                  ],
                )), //루트 추천
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: proceeding_dogam_controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(width: 1,color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset("assets/home_assets/jeju.jpg",fit: BoxFit.fitWidth,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Stack(
                                          children: [
                                            Text(
                                              '@Lee_dong_Yull',
                                              style: TextStyle(
                                                fontSize: 20,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 3
                                                  ..color = Colors.black,
                                              ),
                                            ),
                                            // The text inside
                                            const Text(
                                              '@Lee_dong_Yull',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("제주도 완전정복",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("도감에 등록할 수 있는 관광지 수 13개",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w900,color: Colors.grey),),
                                  Row(
                                    children: [
                                      Text("3.6",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.yellow),),
                                      Text("(1232)",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.grey),),
                                      SizedBox(width: 10,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ), //루트추천 컨테이너
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Container(child: Row(
                  children: [
                    Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                    Flexible(flex:8,child:Align(alignment: Alignment.centerLeft,child: Text("금주의 추천 여행지",style: TextStyle(fontWeight: FontWeight.w900),)), ),
                    Flexible(flex:1,fit: FlexFit.tight,child: SizedBox())
                  ],
                )), //금주의 추천 여행지
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: proceeding_dogam_controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(width: 1,color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset("assets/home_assets/songdo.jpg",fit: BoxFit.fitWidth,),
                                  Align(alignment: Alignment.topRight,child: Icon(Icons.shopping_cart,size: 50,color: Colors.red,),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("송도 케이블카",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Icon(Icons.star,color: Colors.yellow,),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("부산도감",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w900,color: Colors.grey),),
                                  Row(
                                    children: [
                                      Text("3.6",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.yellow),),
                                      Text("(1232)",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.grey),),
                                      SizedBox(width: 10,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),//추천 여행지 컨테이너
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Container(child: Row(
                  children: [
                    Flexible(flex: 1,fit: FlexFit.tight,child: SizedBox(),),
                    Flexible(flex:8,
                        child:Container(
                          height: 50,
                          child:MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff8958F1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("추천 여행지가 포함된 루트 추천 보러가기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,height: 1),),
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
            )
          ],
        ),
        bottomNavigationBar: bottom_bar(),
      ),
    );
  }
}
