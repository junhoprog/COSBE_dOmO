import 'package:cosbe_domo/dogam_page/dogam_upload_page.dart';
import 'package:cosbe_domo/map_page/Marker.dart';
import 'package:flutter/material.dart';
import 'variable/do_variable/chungbuk_variable/cheongju_variable.dart';
import 'variable/dogam_variable.dart';
import 'variable/do_variable/chungbuk_variable/chungbuk_si_variable.dart';
import 'package:cosbe_domo/dogam_page/dogam_post_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/cheongju_variable.dart';

class dogam_album_page extends StatefulWidget {
  const dogam_album_page({Key? key,this.index=0}) : super(key: key);
  final int index;

  @override
  State<dogam_album_page> createState() => _dogam_albumState();
}

class _dogam_albumState extends State<dogam_album_page> {
  final firestore=FirebaseFirestore.instance;
  String url="";

  getData(int index) async {
    var i = 0;
    var result = await firestore.collection("cheongju").doc("${Imagemap_cheongju_title.keys.elementAt(index)}").get();
    url_cheongju_List[index]=result['url'];
     return url_cheongju_List[index];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width/3*2,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: new Image.asset("${chungbuk_si_dogam_image[widget.index]}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.keyboard_arrow_left,size: 50,color: Colors.white,))
                  ),
                  Positioned(
                    top:145,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${chungbuk_si_dogam_map.keys.elementAt(widget.index)}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:Colors.white),),
                        Text("${chungbuk_si_dogam_map.values.elementAt(widget.index)}",style: TextStyle(fontSize:20,color:Colors.white),),
                      ],
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/15,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4*2,
              child: ListView.builder(
                controller: dogam_album_controller,
                scrollDirection: Axis.horizontal,
                itemCount: Imagemap_cheongju.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  FutureBuilder(
                    future: getData(index),
                                builder:(BuildContext context,AsyncSnapshot snapshot)=>
                                url_cheongju_List[index]==""
                            ? Stack(
                                children: [
                              ColorFiltered(
                              colorFilter: ColorFilter.mode(markermap.values.elementAt(index)==true ? Colors.grey : Colors.transparent, BlendMode.saturation),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                onPressed:
                                markermap.values.elementAt(index)== true ?
                                (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>upload_page(index:index))
                                  );
                                }
                                : (){
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('${Imagemap_cheongju_title.keys.elementAt(index)}'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              Text('아직 ${Imagemap_cheongju_title.keys.elementAt(index)} 에 글과 사진을 등록하실 수 없습니다.'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('네'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Image.asset(
                                  "${Imagemap_cheongju.keys.elementAt(index)}",
                                  fit: BoxFit.fitHeight,
                                  width: MediaQuery.of(context).size.width/2,
                                  height: MediaQuery.of(context).size.height/5*2,
                                ),
                              )
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(Icons.add_a_photo_outlined,size: 40,),
                            )
                          ],
                        )
                          :Container(
                  child:MaterialButton(
                  padding:EdgeInsets.zero,
                  child: Image.network(url_cheongju_List[index],
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/5*2,
                  ),
                  onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>dogam_post_page(index:index))
                  );
                  },
                  )
                  )
                  ),
                  Text("${Imagemap_cheongju_title.keys.elementAt(index)}",style: TextStyle(fontSize: 20),),
                  Text("${Imagemap_cheongju_title.values.elementAt(index)}"),
                      ]
              ),

            );
          }
        ),
      ),
          ],
    )
    ),
    );
  }
}
