import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../csv_list.dart';
import '../dogam_page/variable/do_variable/si_variable/chungbuk/yeongdong/yeongdong_variable.dart';

String title="";
String description="";
String adress="";

Future read_csv_information(int index) async{
  final _rawData = await rootBundle.loadString(csv_List[8][3]);
  List<List<dynamic>> _listData =
  const CsvToListConverter().convert(_rawData,eol: "\n",allowInvalid: true);
  title=_listData[index+1][1];
  description = _listData[index+1][3];
  adress=_listData[index+1][2];
}

class information_page extends StatefulWidget {
  const information_page({Key? key,this.index=0}) : super(key: key);
  final int index;
  @override
  State<information_page> createState() => _information_pageState();
}

class _information_pageState extends State<information_page> {
  @override
  Widget build(BuildContext context) {
    read_csv_information(widget.index);
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children : [
              Image.asset(Imagemap_yeongdong.keys.elementAt(widget.index),height: MediaQuery.of(context).size.height/10*6,fit: BoxFit.fitHeight,),
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
                                child: Center(child: Text("자연",style: TextStyle(color: Colors.white),)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${title}",style: TextStyle(fontSize: 25),),
                                Text("Lv4",style: TextStyle(color: Colors.red,fontSize: 17))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.grey[600],),
                                Text("${adress}",style: TextStyle(color: Colors.grey[600],),)
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
                              itemCount: 3,
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
                                          child: Center(child: Text("${description}")),
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
                                                      Imagemap_yeongdong.keys.elementAt(0),
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
                                                      Imagemap_yeongdong.keys.elementAt(1),
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
