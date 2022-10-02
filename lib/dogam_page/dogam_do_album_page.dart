import 'package:cosbe_domo/bottom_bar/bottom_bar.dart';
import 'package:cosbe_domo/dogam_page/dogam_si_album_page.dart';
import'package:flutter/material.dart';
import'variable/do_variable/do_variable.dart';
import 'variable/dogam_variable.dart';

class dogam_do_album_page extends StatelessWidget {
  const dogam_do_album_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text('여행지 도감',style:TextStyle(
            color:Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )
          ),
          elevation: 0,
        ),

        body:Container(
            margin:EdgeInsets.fromLTRB(0, 20, 0, 20),
            child:ListView.builder(
              controller: dogam_do_album_controller,
              itemCount: do_dogam_text.length,
              itemBuilder: (BuildContext context, int index) {
                if(index%2==0)
                {
                  if(index==8)
                    {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Column(
                            children: [
                              MaterialButton(
                                child:ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child:(
                                      new Image.asset(
                                        width:MediaQuery.of(context).size.width/10*4,
                                        height:MediaQuery.of(context).size.height/4,
                                        '${do_dogam_image[index]}',
                                        fit:BoxFit.fill,
                                      )
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=> dogam_si_album_page(index: index,))
                                  );//navigator
                                },
                                padding:EdgeInsets.zero,
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width/10*4,
                                height: MediaQuery.of(context).size.height/20,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text('${do_dogam_text[index]}',style:TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      )),

                                    ]
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MaterialButton(
                                child:ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child:(
                                      new Image.asset(
                                        width:MediaQuery.of(context).size.width/10*4,
                                        height:MediaQuery.of(context).size.height/4,
                                        '${do_dogam_image[index+1]}',
                                        fit:BoxFit.fill,
                                      )
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=> dogam_si_album_page(index: index+1))
                                  );//navigator
                                },
                                padding:EdgeInsets.zero,
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width/10*4,
                                height: MediaQuery.of(context).size.height/20,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text('${do_dogam_text[index+1]}',style:TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      )),
                                    ]
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children:<Widget>[
                              Container(),
                            ]
                            ),
                        ],
                      );
                    }
                  else{
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Column(
                        children: [
                          MaterialButton(
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:(
                                  new Image.asset(
                                    width:MediaQuery.of(context).size.width/10*4,
                                    height:MediaQuery.of(context).size.height/4,
                                    '${do_dogam_image[index]}',
                                    fit:BoxFit.fill,
                                  )
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> dogam_si_album_page(index: index,))
                              );//navigator
                            },
                            padding:EdgeInsets.zero,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width/10*4,
                            height: MediaQuery.of(context).size.height/20,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('${do_dogam_text[index]}',style:TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  )),

                                ]
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:(
                                  new Image.asset(
                                    width:MediaQuery.of(context).size.width/10*4,
                                    height:MediaQuery.of(context).size.height/4,
                                    '${do_dogam_image[index+1]}',
                                    fit:BoxFit.fill,
                                  )
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> dogam_si_album_page(index: index+1))
                              );//navigator
                            },
                            padding:EdgeInsets.zero,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width/10*4,
                            height: MediaQuery.of(context).size.height/20,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text('${do_dogam_text[index+1]}',style:TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  )),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                  }
                }
                else{
                  return SizedBox();
                }
              },
            )
        ),
        bottomNavigationBar: bottom_bar(),
      ),
    );
  }
}
//광역시를 없애고 도만?
