import 'package:cosbe_domo/information_page/information_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dogam_page/variable/do_variable/si_variable/chungbuk/yeongdong/yeongdong_variable.dart';

class recommend_page extends StatefulWidget {
  const recommend_page({Key? key}) : super(key: key);

  @override
  State<recommend_page> createState() => _recommend_pageState();
}

int current_tap=0;

class _recommend_pageState extends State<recommend_page> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children : [
              Image.asset("assets/recommend_assets/mulhan.jpg",height: MediaQuery.of(context).size.height/10*6,fit: BoxFit.fitHeight,),
              Positioned(
                  top: 20,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.keyboard_arrow_left,size: 50,color: Colors.white,))
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.8,
                  builder:(BuildContext context, ScrollController scrollController) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/6,
                                height: MediaQuery.of(context).size.height/20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff7D83FF)
                                ),
                                child: Center(child: Text("충청북도",style: TextStyle(color: Colors.white),)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/6,
                                height: MediaQuery.of(context).size.height/20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff7D83FF)
                                ),
                                child: Center(child: Text("풍경",style: TextStyle(color: Colors.white),)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/6,
                                height: MediaQuery.of(context).size.height/20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff7D83FF)
                                ),
                                child: Center(child: Text("계곡",style: TextStyle(color: Colors.white),)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("영동 풍경 즐기기",style: TextStyle(fontSize: 25),),
                                Text("Lv4",style: TextStyle(color: Colors.red,fontSize: 17))
                              ],
                            ),
                          ),
                          Container(margin: EdgeInsets.only(left: 10),child: Text("도감에 등록할 수 있는 관광지 4개",style: TextStyle(color: Colors.grey),)),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){
                                      setState(() {
                                        current_tap=0;
                                      });
                                    },
                                    child: Text(
                                      "About",
                                      style: TextStyle(color: current_tap==0 ? Color(0xff656CFF) : Colors.grey,fontSize: 20),
                                    ),
                                ),
                                MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    setState(() {
                                      current_tap=1;
                                    });
                                  },
                                  child: Text(
                                    "Spot",
                                    style: TextStyle(color: current_tap==1 ? Color(0xff656CFF) : Colors.grey,fontSize: 20),
                                  ),
                                ),
                                MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    setState(() {
                                      current_tap=2;
                                    });
                                  },
                                  child: Text(
                                    "Review",
                                    style: TextStyle(color: current_tap==2 ? Color(0xff656CFF) : Colors.grey,fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: ((){
                                if(current_tap==0){
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    height: MediaQuery.of(context).size.height/5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]
                                    ),
                                    child: Center(child: Text("전통과 자연이 어우러진 예향의 고장! 산, 계곡 휴양지 등 볼거리가 많은 영동에 한번 놀러오시는건 어떨까요? 풍경을 중심으로 여행하실 수 있습니다.")),
                                  );
                                }
                                if(current_tap==1) {
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      controller: scrollController,
                                      itemCount: Imagemap_yeongdong.length-1,
                                      itemBuilder: (context,index){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                MaterialButton(
                                                  padding: EdgeInsets.zero,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child:(
                                                        Image.asset(
                                                          width:MediaQuery.of(context).size.width/100*40,
                                                          height:MediaQuery.of(context).size.height/5,
                                                          Imagemap_yeongdong.keys.elementAt(index),
                                                          fit:BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  onPressed: (){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context)=>information_page(index: 0,))
                                                    );
                                                  },
                                                ),
                                                Container(
                                                width:MediaQuery.of(context).size.width/100*40,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("용두정",style: TextStyle(fontWeight: FontWeight.bold),),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.location_on_outlined,color: Colors.grey[600],),
                                                          Text("영동군 영동읍",style: TextStyle(color: Colors.grey[600]),)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                MaterialButton(
                                                  padding: EdgeInsets.zero,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child:(
                                                        Image.asset(
                                                          width:MediaQuery.of(context).size.width/100*40,
                                                          height:MediaQuery.of(context).size.height/5,
                                                          Imagemap_yeongdong.keys.elementAt(index+1),
                                                          fit:BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  onPressed: (){
                                                    Navigator.push(context,
                                                      MaterialPageRoute(builder: (context)=>information_page(index: 1,))
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  width:MediaQuery.of(context).size.width/100*40,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("난계국악박물관",style: TextStyle(fontWeight: FontWeight.bold),),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.location_on_outlined,color: Colors.grey[600],),
                                                          Text("영동군 심천면",style: TextStyle(color: Colors.grey[600]),)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                }
                                if(current_tap==2){
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    height: MediaQuery.of(context).size.height/5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]
                                    ),
                                    child: Center(child: Text("아직 리뷰가 없습니다.")),
                                  );
                                }
                              }()),
                            ),
                          ),
                        ],
                      )
                    );
                  },
              )
            ]
        ),
      ),
    );
  }
}