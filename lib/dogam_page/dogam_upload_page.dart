import 'dart:ui';
import 'package:cosbe_domo/dogam_page/dogam_post_page.dart';
import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(MaterialApp(home: upload_page(),));
}

class upload_page extends StatefulWidget {
  const upload_page({Key? key,this.index=0}) : super(key: key);
  final int index;
  @override
  State<upload_page> createState() => _upload_pageState();
}

class _upload_pageState extends State<upload_page> {
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
          title: Text("상당산성",style: TextStyle(color: Colors.black),),
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
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>dogam_post_page(index: widget.index,))
                        );
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
                    ),
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
                          child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                label: Align(alignment:Alignment.centerLeft,child: Text('title')),
                              )
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width/3*2,
                      height: MediaQuery.of(context).size.height/4,
                      color: Colors.grey[300],
                      child: TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                             border: InputBorder.none,
                            label: Align(alignment:Alignment.topLeft,child: Text('Description')),
                          )
                      )
                    ),
                    MaterialButton(
                      onPressed: (){},
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
