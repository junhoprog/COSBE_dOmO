import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import'package:flutter/material.dart';
import'variable/do_variable/chungbuk_variable/chungbuk_si_variable.dart';
import 'variable/do_variable/do_variable.dart';
import 'dogam_album_page.dart';
import 'variable/do_variable/chungbuk_variable/cheongju_variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class dogam_si_album_page extends StatefulWidget {
  const dogam_si_album_page({Key? key,this.index=0}) : super(key: key);
final int index;
  @override
  State<dogam_si_album_page> createState() => _dogam_si_album_pageState();
}

class _dogam_si_album_pageState extends State<dogam_si_album_page> {

  final firestore=FirebaseFirestore.instance;
  List<List<dynamic>> data=[];
  final auth = FirebaseAuth.instance;
  int count=0;

  void _loadCSV() async {
    int j=0;
    while (j<11) {
      final _rawData = await rootBundle.loadString(csv_cheongju_List[j]);
      List<List<dynamic>> _listData =
      const CsvToListConverter().convert(_rawData);
      setState(() {
        data = _listData;
      });
    }

  }

  @override
  void initState(){
    _loadCSV();
    getCount(widget.index);
  }

  void getCount(int index) async {
    var i = 0;
    while (i < 11) {
      var result = await firestore.collection('${auth.currentUser?.uid}').doc(
          "${data[i][1]}").get();
      url_cheongju_List[i] = result['url'];
      if(url_cheongju_List[i]!="")
       { count++;}
      i++;

    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_,index){
            return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: MaterialButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.keyboard_arrow_left,size: 40,),
          ),
          title:Text('${data[index][1]}',style:TextStyle(
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
                itemCount: 11,
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
                                        new Image.asset(
                                          width: MediaQuery.of(context).size.width/20*19,
                                          height: MediaQuery.of(context).size.height/3,
                                          '${chungbuk_si_dogam_image[index]}',
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>dogam_album_page(index: index,)));//navigator
                                  },
                                  padding:EdgeInsets.zero,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:[
                                      Text('${chungbuk_si_dogam_map.keys.elementAt(index)}',style:TextStyle(
                                        fontSize:30,
                                        color: Colors.white,
                                      )
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom:10,
                                  right: 10,
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:[
                                          Text('${count}/${data.length}',style:TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          )),

                                        ]
                                    ),
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
            )
            );
          },
        ),
      ),
    );;
  }
}



