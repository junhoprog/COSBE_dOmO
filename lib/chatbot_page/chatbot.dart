import 'package:flutter/material.dart';

import 'chat.dart';
import 'message.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.keyboard_arrow_left,color: Colors.white,size: 40,),
          ),
          backgroundColor: Color(0xff656CFF),
          title: Text("dOmO"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Chat(),
              ),
              Message(),
            ],
          ),
        ),
      ),
    );
  }
}
