import 'dart:io';
import 'dart:ui';
import 'package:cosbe_domo/dogam_page/variable/do_variable/do_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungbuk/cheongju/cheongju_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungbuk/chungbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/chungnam/chungnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gangwon/gangwon_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gwangyeok/gwangyeok_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongbuk/gyeongbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeonggi/gyeonggi_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/gyeongnam/gyeongnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonbuk/jeonbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/si_variable/jeonnam/jeonnam_si_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cosbe_domo/dogam_page/dogam_album_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';

class upload_page extends StatefulWidget {
  const upload_page({Key? key,this.index=1,this.si_num=1,this.do_num=1}) : super(key: key);
  final int index;
  final int si_num;
  final int do_num;

  @override
  State<upload_page> createState() => _upload_pageState();
}

class _upload_pageState extends State<upload_page> {

  List level_exp = [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];
  PickedFile? pickedFile;
  FirebaseStorage storage=FirebaseStorage.instance;
  final firestore=FirebaseFirestore.instance;
  String url="";
  var images;
  String title="";
  String description="";
  int level=0;
  int exp=0;
  String name="";
  bool marker=false;
  var totallevel=0;
  List<List<dynamic>> data=[];
  final auth = FirebaseAuth.instance;

  void _loadCSV() async {
    final _rawData;
    List<List<dynamic>>_listData;
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
    get_Infor();
  }

  Future get_Infor()async{
    var result=await firestore
        .collection('${auth.currentUser?.uid}')
        .doc('유저정보').get();
    level=result['level'];
    exp=result['exp'];
    name=result['name'];
  }
  Future upload_Infor(int index)async{
    if(data[index][6]==1){
      exp=exp+1;
      if(exp >= level_exp[level - 1])
        {
          int t=level_exp[level - 1];
         exp=exp-t;
          level++;
        }
    }
    else if(data[index][6]==2){
      exp=exp+2;
      if(exp >= level_exp[level - 1])
      {
        int t=level_exp[level - 1];
      exp=exp-t;
        level++;
      }
    }
    else if(data[index][6]==3){
      exp=exp+3;
      if(exp >= level_exp[level - 1])
      {
        int t=level_exp[level - 1];
      exp=exp-t;
        level++;
      }
    }
    else if(data[index][6]==4){
      exp=exp+4;
      if(exp >= level_exp[level - 1])
      {
        int t=level_exp[level - 1];
      exp=exp-t;
        level++;
      }
    }
    firestore
        .collection('${auth.currentUser?.uid}')
        .doc('유저정보')
        .set({'name':'${name}','level':'${level}','exp':'${exp}','email':'${auth.currentUser?.email}'});
  }

  Future uploadFile1(int index)async{
    int count=0;
    int filename=count;

    if(widget.do_num==0)
    {
    filename=index;
    final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${gwangyeok_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
    // 파일 업로드
    final uploadTask = firebaseStorageRef.putFile(
    images
    );
    await uploadTask.whenComplete(() => null);
    url= await firebaseStorageRef.getDownloadURL();
    url_cheongju_List[index]=url;
    firestore
        .collection('${auth.currentUser?.uid}')
        .doc('${do_dogam_text[widget.do_num]}')
        .collection('${gwangyeok_dogam_list[widget.si_num]}')
        .doc('${data[index][1]}')
        .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});
    }
    else if(widget.do_num==1)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${gyeonggi_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${gyeonggi_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});
    }
    else if(widget.do_num==2)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${chungbuk_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${chungbuk_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});
    }
    else if(widget.do_num==3)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${jeonbuk_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${jeonbuk_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});

    }
    else if(widget.do_num==4)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${gangwon_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${gangwon_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});

    }
    else if(widget.do_num==5)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${gyeongbuk_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${gyeongbuk_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});

    }
    else if(widget.do_num==6)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${gyeongnam_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${gyeongnam_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});
    }
    else if(widget.do_num==7)    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${chungnam_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${chungnam_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});

    }
    else if(widget.do_num==8)
    {
      filename=index;
      final firebaseStorageRef = storage.ref().child('${auth.currentUser?.uid}').child('${do_dogam_text[widget.do_num]}').child('${jeonnam_dogam_list[widget.si_num]}/${data[widget.si_num][1]}.png');
      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          images
      );
      await uploadTask.whenComplete(() => null);
      url= await firebaseStorageRef.getDownloadURL();
      url_cheongju_List[index]=url;
      firestore
          .collection('${auth.currentUser?.uid}')
          .doc('${do_dogam_text[widget.do_num]}')
          .collection('${jeonnam_dogam_list[widget.si_num]}')
          .doc('${data[index][1]}')
          .set({'url':'${url}','title':'${title}','description':'${description}','marker':'${marker}','name':'${auth.currentUser?.displayName}','level':'${data[index][6]}','totallevel':'${totallevel}'});
    }
  }

  Future selectFile1()async{
    final result= await ImagePicker().getImage(source:ImageSource.gallery);
    if(result==null) return;//아무것도 꺼내지않았을 때
    setState((){
      pickedFile=result;
    });
    images= File(pickedFile!.path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: MaterialButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.keyboard_arrow_left,size: 40,),
          ),
          title: Text(data[widget.index][1].toString(),style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: ListView(
              controller: dogam_upload_controller,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    pickedFile==null
                        ? MaterialButton(
                      onPressed: (){
                        selectFile1();
                      },
                      child: DottedBorder(
                          strokeWidth: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width/3*2,
                            height: MediaQuery.of(context).size.height/3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.add_photo_alternate_outlined,size: MediaQuery.of(context).size.height/5,),
                                Text("사진을 등록해 주세요.")
                              ],
                            ),
                          )
                      ),
                    )

                        : Container(
                      width: MediaQuery.of(context).size.width/3*2,
                      height: MediaQuery.of(context).size.height/3,
                      child:Image.file(images),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width/3*2,
                      height: MediaQuery.of(context).size.height/15,
                      color: Colors.grey[300],
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                label: Align(alignment:Alignment.centerLeft,child: Text('title')),
                              ),
                              onChanged:  (value){
                                title=value;
                              }
                          )
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width/3*2,
                        height: MediaQuery.of(context).size.height/4,
                        color: Colors.grey[300],
                        child: TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              label: Align(alignment:Alignment.topLeft,child: Text('Description')),
                            ),
                            onChanged:(value){
                              description=value;
                            }
                        )
                    ),
                    MaterialButton(
                      onPressed: (){
                        uploadFile1(widget.index);
                        upload_Infor(widget.index);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>dogam_album_page(si_num:widget.si_num, do_num:widget.do_num))
                        );
                      },

                      child: Container(
                        width: MediaQuery.of(context).size.width/3*2,
                        height: MediaQuery.of(context).size.height/15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff8958F1)
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("도감에 등록하기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}