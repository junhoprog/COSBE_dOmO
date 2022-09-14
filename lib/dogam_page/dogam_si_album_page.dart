import 'package:cosbe_domo/dogam_page/variable/dogam_variable.dart';
import'package:flutter/material.dart';
import'variable/do_variable/chungbuk_variable/chungbuk_si_variable.dart';
import 'variable/do_variable/do_variable.dart';
import 'dogam_album_page.dart';

class dogam_si_album_page extends StatelessWidget {
  const dogam_si_album_page({Key? key,this.index=0}) : super(key: key);
  final int index;

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
          title:Text('${do_dogam_text[index]}',style:TextStyle(
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
                                      Text('${chungbuk_si_dogam_collect[index]}',style:TextStyle(
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
        ),
      ),
    );
  }
}