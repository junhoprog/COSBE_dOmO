import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/do_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungbuk/chungbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungnam/chungnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gangwon/gangwon_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gwangyeok/gwangyeok_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongbuk/gyeongbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeonggi/gyeonggi_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonbuk/jeonbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongnam/gyeongnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonnam/jeonnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import 'package:cosbe_domo/map_page/map_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'dogam_album_page.dart';

class dogam_si_album_page extends StatefulWidget {
  const dogam_si_album_page({Key? key,this.index=0}) : super(key: key);
final int index;
  @override
  State<dogam_si_album_page> createState() => _dogam_si_album_pageState();
}

class _dogam_si_album_pageState extends State<dogam_si_album_page> {
  var do_num;
  int items=1;
  String s="";
  var result;
  final firestore=FirebaseFirestore.instance;
  List<int>num=[];

  final auth = FirebaseAuth.instance;
  String _ImgCSV(int index) {
    if(do_num==0)
    {
      return gwangyeog_dogam_image[index];
    }
    else if(do_num==1)
    {
      return gyeonggi_dogam_image[index];
    }
    else if(do_num==2)
    {
      return chungbuk_dogam_image[index];
    }
    else if(do_num==3)
    {
      return jeonbuk_dogam_image[index];
    }
    else if(do_num==4)
    {
      return gangwon_dogam_image[index];
    }
    else if(do_num==5)
    {
      return gyeongbuk_dogam_image[index];
    }
    else if(do_num==6)
    {
      return gyeongnam_dogam_image[index];
    }
    else if(do_num==7)
    {
      return chungnam_dogam_image[index];
    }
    else if(do_num==8)
    {
      return jeonnam_dogam_image[index];
    }
    return "null";
  }
  String dogam_list(int index) {

    if(do_num==0)
    {
      return gwangyeok_dogam_list[index];
    }
    else if(do_num==1)
    {
      return gyeonggi_dogam_list[index];
    }
    else if(do_num==2)
    {
      return chungbuk_dogam_list[index];
    }
    else if(do_num==3)
    {
      return jeonbuk_dogam_list[index];
    }
    else if(do_num==4)
    {
      return gangwon_dogam_list[index];
    }
    else if(do_num==5)
    {
      return gyeongbuk_dogam_list[index];
    }
    else if(do_num==6)
    {
      return gyeongnam_dogam_list[index];
    }
    else if(do_num==7)
    {
      return chungnam_dogam_list[index];
    }
    else if(do_num==8)
    {
      return jeonnam_dogam_list[index];
    }
    return "null";
  }

  void init(){
    if(do_num==0)
      {
        items=gwangyeok_dogam_list.length;
      }
    else if(do_num==1)
      {
        items=gyeonggi_dogam_list.length;
      }
    else if(do_num==2)
    {
      items=chungbuk_dogam_list.length;
    }
    else if(do_num==3)
    {
      items=jeonbuk_dogam_list.length;
    }
    else if(do_num==4)
    {
      items=gangwon_dogam_list.length;
    }
    else if(do_num==5)
    {
      items=gyeongbuk_dogam_list.length;
    }
    else if(do_num==6)
    {
      items=gyeongnam_dogam_list.length;
    }
    else if(do_num==7)
    {
      items=chungnam_dogam_list.length;
    }
    else if(do_num==8)
    {
      items=jeonnam_dogam_list.length;
    }
  }

 Future register_dogam(int index) async{
        if(do_num==0)
          {
            var result= await firestore
                .collection('${auth.currentUser?.uid}')
                .doc('${do_dogam_text[do_num]}')
                .collection(gwangyeok_dogam_list[index]).get();
           int num=result.docs.length;
           s="${num}/${gwangyeog_dogam_num[index]}";
           return s;
          }
        else if(do_num==1)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(gyeonggi_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${gyeonggi_dogam_num[index]}";
          return s;
        }
        else if(do_num==2)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(chungbuk_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${chungbuk_dogam_num[index]}";
          return s;
        }
        else if(do_num==3)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(jeonbuk_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${jeonbuk_dogam_num[index]}";
          return s;
        }
        else if(do_num==4)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(gangwon_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${gangwon_dogam_num[index]}";
          return s;
        }
        else if(do_num==5)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(gyeongbuk_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${gyeongbuk_dogam_num[index]}";
          return s;
        }
        else if(do_num==6)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(gyeongnam_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${gyeongnam_dogam_num[index]}";
          return s;
        }
        else if(do_num==7)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(chungnam_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${chungnam_dogam_num[index]}";
          return s;
        }
        else if(do_num==8)
        {
          var result= await firestore
              .collection('${auth.currentUser?.uid}')
              .doc('${do_dogam_text[do_num]}')
              .collection(jeonnam_dogam_list[index]).get();
          int num=result.docs.length;
          s="${num}/${jeonnam_dogam_num[index]}";
          return s;
        }
  }
  @override
  void initState() {
    do_num=widget.index;
    setState(() {
      init();
    });

    super.initState();
  }
  /*@override
  void initState(){
    do_num=widget.index;
    setState(){
      init();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: MaterialButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.keyboard_arrow_left,size: 40,),
          ),
          title:Text('${do_dogam_text[do_num]}',style:TextStyle(
            color:Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )
          ),
          elevation: 0,
        ),
        body:Container(
              child: ListView.builder(
                controller: dogam_si_album_controller,
                itemCount: items,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children:<Widget> [
                      Flexible(flex:3,fit: FlexFit.tight,
                          child: SizedBox()),
                      Flexible(
                        flex:94,fit: FlexFit.tight,
                        child: Column(
                          children:[
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children:[
                                MaterialButton(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:(
                                        Image.asset(
                                          width: MediaQuery.of(context).size.width/20*19,
                                          height: MediaQuery.of(context).size.height/3,
                                          _ImgCSV(index),
                                          fit: BoxFit.fill,
                                        )

                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>dogam_album_page(si_num: index,do_num:do_num)));//navigator
                                  },
                                  padding:EdgeInsets.zero,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:[
                                      Text(dogam_list(index),style:TextStyle(
                                        fontSize:30,
                                        color: Colors.white,
                                      )
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Stack(
                                    children: <Widget>[
                                      // Stroked text as border.
                                      Text(
                                        "LV.${csv_level[dogam_list(index)]}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 6
                                            ..color=((){
                                                if("${csv_level[dogam_list(index)]}"=="1"){
                                                  return Colors.blue;
                                                }
                                                else if("${csv_level[dogam_list(index)]}"=="2"){
                                                  return Colors.green;
                                                }
                                                else if("${csv_level[dogam_list(index)]}"=="3"){
                                                  return Colors.purple;
                                                }
                                                else{
                                                  return Colors.red;
                                                }
                                            }()),
                                        ),
                                      ),
                                      // Solid text as fill.
                                      Text(
                                        "LV.${csv_level[dogam_list(index)]}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Positioned(
                                  bottom:10,
                                  right: 10,
                                  child: FutureBuilder(
                                  future: register_dogam(index),
                                  builder:(BuildContext context,AsyncSnapshot snapshot)=>
                                  snapshot.hasData
                                 ? Container(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:[
                                          Text(s,style:TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          )),
                                        ]
                                    ),
                                  )
                                      :Container(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:[
                                          Text("2/14",style:TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          )),
                                        ]
                                    ),
                                  )

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(flex:3,fit: FlexFit.tight,
                          child: SizedBox()),
                    ],
                  );
                },
              ),
            ),
            ),
        );
  }
}



