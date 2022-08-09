import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/cheongju_variable.dart';
import 'package:cosbe_domo/dogam_page/variable/do_variable/chungbuk_variable/chungbuk_si_variable.dart';
import 'package:flutter/material.dart';

class dogam_post_page extends StatefulWidget {
  const dogam_post_page({Key? key,this.index=0}) : super(key: key);
  final int index;
  @override
  State<dogam_post_page> createState() => _dogam_post_pageState();
}

class _dogam_post_pageState extends State<dogam_post_page> {
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
          title: Text("${Imagemap_cheongju_title.keys.elementAt(widget.index)}",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
            MaterialButton(
                onPressed: (){},
              child: Text("수정하기",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/50),
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text("사진",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width/5*4,
                height: MediaQuery.of(context).size.height/4,
                child: Image.asset(
                  "${Imagemap_cheongju.keys.elementAt(widget.index)}",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50,bottom: MediaQuery.of(context).size.height/50),
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text("제목",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width/5*4,
                height: MediaQuery.of(context).size.height/15,
                decoration: BoxDecoration(
                  border: Border.all(width: 1)
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50,bottom: MediaQuery.of(context).size.height/50),
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text("내용",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width/5*4,
                height: MediaQuery.of(context).size.height/10*3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
