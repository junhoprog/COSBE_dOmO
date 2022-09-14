import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/cheongju_variable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/dogam_page/dogam_upload_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:uuid/uuid.dart';\
import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/chungbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/dogam_album_page.dart';
import 'package:flutter/material.dart';
import'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/dogam_page/dogam_upload_page.dart';

class dogam_post_page extends StatefulWidget {
  const dogam_post_page({Key? key,this.index=0}) : super(key: key);
  final int index;
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

  void _loadCSV(int index) async {
    final _rawData = await rootBundle.loadString("${csv_cheongju_List[index]}");
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);
    setState(() {
      data = _listData;
    });
  }
  @override
  void initState(){
    _loadCSV(widget.index);
  }

  GetDataview(int index) async {
    var uuid=Uuid();
    var documentId=uuid.v4();
   // result=await firestore.collection("cheongju").doc('${Imagemap_cheongju_title.keys.elementAt(index)}').get();
    result=await firestore.collection(documentId).doc('${data[index][0].toString()}').get();

    url=result['url'];
    return url;
  }
  GetDataview2(int index) async {

    var uuid=Uuid();
    var documentId=uuid.v4();
    // result=await firestore.collection("cheongju").doc('${Imagemap_cheongju_title.keys.elementAt(index)}').get();
    result=await firestore.collection(documentId).doc('${data[index][0].toString()}').get();

    title=result['title'];
    return title;
  }
  GetDataview3(int index) async {
    var uuid=Uuid();
    var documentId=uuid.v4();
    // result=await firestore.collection("cheongju").doc('${Imagemap_cheongju_title.keys.elementAt(index)}').get();
    result=await firestore.collection(documentId).doc('${data[index][0].toString()}').get();

    description=result['description'];
    return description;
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
          title: Text("${data[widget.index][0].toString()}",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
            MaterialButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>upload_page(index:widget.index))
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
