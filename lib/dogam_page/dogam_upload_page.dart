import 'dart:io';
import 'dart:ui';
import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/cheongju_variable.dart';
import 'package:cosbe_domo/dogam_page/dogam_album_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';

class upload_page extends StatefulWidget {
  const upload_page({Key? key,this.index=1,this.num=1}) : super(key: key);
  final int index;
  final int num;
  @override
  State<upload_page> createState() => _upload_pageState();
}

class _upload_pageState extends State<upload_page> {
  PickedFile? pickedFile;
  FirebaseStorage storage=FirebaseStorage.instance;
  final firestore=FirebaseFirestore.instance;
  String url="";
  var images;
  String title="";
  String description="";
  int count=1;
  List<List<dynamic>> data=[];

  final auth = FirebaseAuth.instance;

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString(csv_cheongju_List[widget.num]);
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);
    setState(() {
      data = _listData;
    });
  }
  @override
  void initState(){
    _loadCSV();
  }

  Future uploadFile1(int index)async{
    int count=0;
    int filename=count;
    final firebaseStorageRef = storage.ref().child('user_image').child('test1').child('${filename}.png');
    // 파일 업로드
    final uploadTask = firebaseStorageRef.putFile(
        images
    );
    await uploadTask.whenComplete(() => null);
    url= await firebaseStorageRef.getDownloadURL();
    url_cheongju_List[index]=url;
    count++;
    //firestore.collection('cheongju').doc('${Imagemap_cheongju_title.keys.elementAt(index)}').set({'url':'${url}','title':'${title}','description':'${description}'});
    firestore.collection('${auth.currentUser?.uid}').doc(data[widget.index][1].toString()).set({'url':'${url}','title':'${title}','description':'${description}','uid':auth.currentUser?.uid});
  }


  Future deleteFile1(int index)async{
   //await firestore.collection("cheongju").doc("${Imagemap_cheongju_title.keys.elementAt(index)}").delete();
    await firestore.collection('${auth.currentUser?.uid}').doc(data[widget.index][1].toString()).delete();

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

                    : Image.file(images),

                    Container(
                      width: MediaQuery.of(context).size.width/3*2,
                      height: MediaQuery.of(context).size.height/20,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("1/5",style: TextStyle(fontSize: 20),),
                      ),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>dogam_album_page(index:widget.num))
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
