import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final _controller = TextEditingController();
  String _userEnterMessage = '';
  String _outputOrError = "";

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': user!.uid,
    });
    _controller.clear();
  }

  Future<void> _sendChatBotMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    final area = "청주";
    String sentence = "";

    if (_userEnterMessage.toString().split(' ')[0] == '!안녕') {
      sentence = "안녕하세요 도모입니다!";
    } else if (_userEnterMessage.toString().split(' ')[0] == '!날씨') {
      sentence = " 현재 날씨는 ";
      String day =
      DateFormat('yyyyMMdd').format(DateTime.now().add(Duration(hours: 9)));
      String apiKey =
          'BsWjauEPurdxlyYK6jPg%2FsTprdhoQobX65%2FVLTaczX%2BPNbZ%2FeYU8y12kV%2B6MztPTIsxS1yagDl5Pym%2BsIWt7Fg%3D%3D';
      String network =
          'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?ServiceKey=$apiKey&numOfRows=10&pageNo=1&base_date=$day&base_time=0600&nx=55&ny=127&dataType=JSON';

      var parsingData;
      http.Response response = await http.get(Uri.parse(network));
      if (response.statusCode == 200) {
        String jsonData = response.body;
        parsingData = jsonDecode(jsonData);
      }

      int sky = -1, pty = -1;
      List<dynamic> par = parsingData['response']['body']['items']['item'];
      for (int i = 0; i < par.length; i++) {
        if (par[i]['category'] == 'SKY') {
          sky = int.parse(par[i]['obsrValue'][0]);
        } else if (par[i]['category'] == 'PTY') {
          pty = int.parse(par[i]['obsrValue'][0]);
        }
      }

      if (pty == 0) {
        if (sky <= 2) {
          sentence += "맑음 입니다.";
        } else if (sky == 3) {
          sentence += "구름많음 입니다.";
        } else if (sky == 4) {
          sentence += "흐림 입니다.";
        }
      } else {
        sentence += "비/눈 입니다.";
      }
    } else if (_userEnterMessage.toString().split(' ')[0] == '!관광지') {
      sentence = "주변 관광지입니다";
    } else if (_userEnterMessage.toString().split(' ')[0] == '!추천') {
      sentence = "추천 감사합니다.\n최대한 빠르게 반영하겠습니다!";
    }
    else if (_userEnterMessage.toString().split(' ')[0] == '!명령어') {
      sentence = "저의 기능은 다음과 같습니다.\n1. 날씨를 받아보세요. ex)!날씨 \n2. 주변 관광지를 받아보세요. ex)!관광지 \n3. 여러분이 아는 여행지를 등록해주세요.ex)!추천 OO\n4. 저에게 인사를 해주세요! ex)!안녕\n감사합니다!";
    } else {
      sentence = "무슨 말인지 잘 모르겠네요";
    }

    FirebaseFirestore.instance.collection('chat').add({
      'text': sentence,
      'time': Timestamp.now(),
      'userID': user!.uid + '/chatbot',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message...'),
                onChanged: (value) {
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              ),
            ),
            IconButton(
              onPressed: () {
                if (!_userEnterMessage.trim().isEmpty) _sendMessage();
                _sendChatBotMessage();
              },
              icon: Icon(Icons.send),
              color: Colors.blue,
            )
          ],
        ));
  }
}