import 'package:cosbe_domo/dogam_page/variable/do_variable/do_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungbuk/chungbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungnam/chungnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gangwon/gangwon_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gwangyeok/gwangyeok_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongbuk/gyeongbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeonggi/gyeonggi_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongnam/gyeongnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonbuk/jeonbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonnam/jeonnam_si_variable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/dogam_page/dogam_upload_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dogam_post_page extends StatefulWidget {
  const dogam_post_page({Key? key,this.index=0,this.si_num=0,this.do_num=0}) : super(key: key);
  final int index;
  final int si_num;
  final int do_num;
  @override
  State<dogam_post_page> createState() => _dogam_post_pageState();
}

class _dogam_post_pageState extends State<dogam_post_page> {
  final firestore=FirebaseFirestore.instance;
  String url="";
  String title="";
  String description="";
  var result;

  List<List<dynamic>> data=[];
  final auth = FirebaseAuth.instance;

  void _loadCSV() async {
    final _rawData;
    List<List<dynamic>> _listData;

    if (widget.do_num == 0) {
      final _rawData = await rootBundle.loadString(
          csv_gwangyeog_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }

    else if (widget.do_num == 1) {
      final _rawData = await rootBundle.loadString(
          csv_gyeonggi_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 2) {
      final _rawData = await rootBundle.loadString(
          csv_chungbuk_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 3) {
      final _rawData = await rootBundle.loadString(
          csv_jeonbuk_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 4) {
      final _rawData = await rootBundle.loadString(
          csv_gangwon_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 5) {
      final _rawData = await rootBundle.loadString(
          csv_gyeongbuk_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 6) {
      final _rawData = await rootBundle.loadString(
          csv_gyeongnam_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 7) {
      final _rawData = await rootBundle.loadString(
          csv_chungnam_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
    else if (widget.do_num == 8) {
      final _rawData = await rootBundle.loadString(
          csv_jeonnam_List[widget.si_num]);
      _listData = const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }
  }
  @override
  void initState(){
    _loadCSV();
  }

  GetDataview(int index) async {
       if(widget.do_num==0){
        result=await firestore
        .collection('${auth.currentUser?.uid}')
        .doc('${do_dogam_text[widget.do_num]}')
        .collection(gwangyeok_dogam_list[widget.si_num])
        .doc('${data[index][1]}').get();
    url=result['url'];
    return url;
       }
       else if(widget.do_num==1){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(gyeonggi_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==2){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(chungbuk_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==3){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(jeonbuk_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==4){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(gangwon_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==5){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(gyeongbuk_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==6){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(gyeongnam_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==7){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(chungnam_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
       else if(widget.do_num==8){
         result=await firestore
             .collection('${auth.currentUser?.uid}')
             .doc('${do_dogam_text[widget.do_num]}')
             .collection(jeonnam_dogam_list[widget.si_num])
             .doc('${data[index][1]}').get();
         url=result['url'];
         return url;
       }
  }

  GetDataview2(int index) async {
    if(widget.do_num==0){
      result=await firestore
        .collection('${auth.currentUser?.uid}')
        .doc('${do_dogam_text[widget.do_num]}')
        .collection(gwangyeok_dogam_list[widget.si_num])
        .doc('${data[index][1]}').get();
    title=result['title'];
    return title;
    }
    else if(widget.do_num==1)
      {
        result=await firestore
            .collection('${auth.currentUser?.uid}')
            .doc('${do_dogam_text[widget.do_num]}')
            .collection(gyeonggi_dogam_list[widget.si_num])
            .doc('${data[index][1]}').get();
        title=result['title'];
        return title;
      }
    else if(widget.do_num==2)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(chungbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==3)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(jeonbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==4)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gangwon_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==5)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gyeongbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==6)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gyeongnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==7)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(chungnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
    else if(widget.do_num==8)
    {
      result=await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(jeonnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      title=result['title'];
      return title;
    }
  }
  GetDataview3(int index) async {
    if(widget.do_num==0) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gwangyeok_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==1) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gyeonggi_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==2) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(chungbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==3) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(jeonbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==4) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gangwon_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==5) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gyeongbuk_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==6) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(gyeongnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==7) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(chungnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
    else if(widget.do_num==8) {
      result = await firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection(jeonnam_dogam_list[widget.si_num])
          .doc('${data[index][1]}').get();
      description = result['description'];
      return description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          elevation: 0,
          leading: MaterialButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.keyboard_arrow_left,size: 40,),
          ),
         // title: Text("${Imagemap_cheongju_title.keys.elementAt(widget.index)}",style: TextStyle(color: Colors.black),),
          title: Text("${data[widget.index][1].toString()}",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
            MaterialButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>upload_page(index:widget.index,do_num: widget.do_num,si_num: widget.si_num,amend: true,))
                  );
                },
              child: Text("수정하기",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
            )
          ],
        ),

        body: Center(
    child: ListView(
          children:[Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/50),
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Align(
                      alignment:Alignment.centerLeft,
                    child: Column(
                      children:<Widget> [
                    FutureBuilder(
                    future: GetDataview(widget.index),
                    builder:(BuildContext context,AsyncSnapshot snapshot)=>
                    snapshot.hasData
                        ?Container(
                        child:Image.network('${url}',
                            fit:BoxFit.fitHeight,
                        ),
                        )
                        :Container(

                    ),
                    ),
                      ],
                    )
                  ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50,bottom: MediaQuery.of(context).size.height/50),
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Align(
                      alignment:Alignment.centerLeft,
                      //child: Text("${title}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)

                      child: Column(
                  children:<Widget> [
                  FutureBuilder(
                      future: GetDataview2(widget.index),
                builder:(BuildContext context,AsyncSnapshot snapshot)=>
                snapshot.hasData
                    ?Container(
                    width: MediaQuery.of(context).size.width/5*4,
                    height: MediaQuery.of(context).size.height/15,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1)
                    ),
                  child:Text('${title}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                )
                    :Container(

                ),
              ),
            ],
          )
                  )
              ),

              Container(
                  width: MediaQuery.of(context).size.width/5*4,
                  height: MediaQuery.of(context).size.height/10*3,

                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50,bottom: MediaQuery.of(context).size.height/50),
                  child: Align(
                      alignment:Alignment.centerLeft,

                      child: Column(
                        children:<Widget> [
                          FutureBuilder(
                            future: GetDataview3(widget.index),
                            builder:(BuildContext context,AsyncSnapshot snapshot)=>
                            snapshot.hasData
                                ?Container(
                                width: MediaQuery.of(context).size.width/5*4,
                                height: MediaQuery.of(context).size.height/10*3,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1)
                                ),
                                child:Text('${description}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                            )
                                :Container(

                            ),
                          ),
                        ],
                      )
                  )
              ),
            ],
          ),
          ],
        ),
      ),
      ),
    );
  }
}
