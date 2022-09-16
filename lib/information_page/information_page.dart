import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class information_page extends StatefulWidget {
  const information_page({Key? key}) : super(key: key);

  @override
  State<information_page> createState() => _information_pageState();
}

class _information_pageState extends State<information_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children : [
              Image.asset("assets/recommend_assets/rainbow2.jpg",height: MediaQuery.of(context).size.height/10*6,fit: BoxFit.fitHeight,),
              Positioned(
                  top: 20,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.keyboard_arrow_left,size: 50,color: Colors.white,))
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.55,
                minChildSize: 0.55,
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
                                child: Center(child: Text("문화",style: TextStyle(color: Colors.white),)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/6,
                                height: MediaQuery.of(context).size.height/20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff7D83FF)
                                ),
                                child: Center(child: Text("영화관",style: TextStyle(color: Colors.white),)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("레인보우 영화관",style: TextStyle(fontSize: 25),),
                                Text("Lv4",style: TextStyle(color: Colors.red,fontSize: 17))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.grey[600],),
                                Text("영동군 영동읍 계산로 2길 24",style: TextStyle(color: Colors.grey[600],),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("[유료 광고 포함]",style: TextStyle(color: Colors.grey[600],),),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              controller: scrollController,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                                itemBuilder: (context,index){
                                  if(index==0){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10,top: 5),
                                          child: Text(
                                            "About",
                                            style: TextStyle(color:Color(0xff656CFF),fontSize: 20),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          height: MediaQuery.of(context).size.height/7,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[300]
                                          ),
                                          child: Center(child: Text("영동 레인보우 영화관은 편리한 매표시스템 및 매점 운영, 넓고 아늑한 휴게공간, 대형스크린과 최고급 사양의 넓고 안락한 관람의자를 보유하고 있으며 다양한 장르의 최신영화를 상영한다.")),
                                        ),
                                      ],
                                    );
                                  }
                                  else if(index==1){
                                    return Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child:Text("연관 추천"),
                                    );
                                  }
                                  else{
                                    return Container(
                                      margin: EdgeInsets.only(left: 10,right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                        'assets/recommend_assets/mulhan.jpg',
                                                        fit:BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                onPressed: (){},
                                              ),
                                              Container(
                                                width:MediaQuery.of(context).size.width/100*40,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("물한계곡",style: TextStyle(fontWeight: FontWeight.bold),),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.location_on_outlined,color: Colors.grey[600],),
                                                        Text("영동군 상촌면",style: TextStyle(color: Colors.grey[600]),)
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
                                                        'assets/recommend_assets/rainbow2.jpg',
                                                        fit:BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                onPressed: (){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context)=>information_page())
                                                  );
                                                },
                                              ),
                                              Container(
                                                width:MediaQuery.of(context).size.width/100*40,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("레인보우 영화관",style: TextStyle(fontWeight: FontWeight.bold),),
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
                                        ],
                                      ),
                                    );
                                  }
                                }
                            ),
                          )
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
