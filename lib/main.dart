import 'package:flutter/material.dart';
import 'package:domo/message.dart';
import 'package:domo/chat.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
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
