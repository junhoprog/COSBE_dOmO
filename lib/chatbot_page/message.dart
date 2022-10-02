import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chaquopy/chaquopy.dart';
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

  void makePythonCode(String query) async {
    String code = "import pandas as pd\n";
    code +=
        "df = pd.DataFrame({'request': {0: 'ㅎㅇ', 1: '하이', 2: '하위', 3: '하잉', 4: '하윙', 5: '해윙', 6: '해위', 7: '안녕', 8: '안농', 9: '안녕하세요', 10: '안농하세요', 11: 'ㄴㅆ', 12: '날씨', 13: '날씨 어때요', 14: '날씨 어떤가요', 15: '날씨는 뭔가요', 16: '날씨 알려주세요', 17: 'ㅈㅂ', 18: '주변', 19: '주변 관광지', 20: '주변에 뭐가 있나요', 21: '주변에 볼거', 22: '주변 추천', 23: '관광지 등록', 24: '등록', 25: '여행지 등록', 26: 'ㄷㄹ'}, 'response': {0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0, 10: 0, 11: 1, 12: 1, 13: 1, 14: 1, 15: 1, 16: 1, 17: 2, 18: 2, 19: 2, 20: 2, 21: 2, 22: 2, 23: 3, 24: 3, 25: 3, 26: 3}})\n";
    code +=
        "chat_dic = {0: ['ㅎㅇ'], 1: ['하이'], 2: ['하위'], 3: ['하잉'], 4: ['하윙'], 5: ['해윙'], 6: ['해위'], 7: ['안녕'], 8: ['안농'], 9: ['안녕', '하세요'], 10: ['안농', '하세요'], 11: ['ㄴㅆ'], 12: ['날씨'], 13: ['날씨', '어때'], 14: ['날씨', '어떤가'], 15: ['날씨', '뭔가요'], 16: ['날씨', '알려'], 17: ['ㅈㅂ'], 18: ['주변'], 19: ['주변', '관광지'], 20: ['주변', '뭐', '있나'], 21: ['주변', '볼거'], 22: ['주변', '추천'], 23: ['관광지', '등록'], 24: ['등록'], 25: ['여행지', '등록'], 26: ['ㄷㄹ']}\n";
    code += 'query = "$query"\n';
    code += "def chat(request):\n";
    code += "    for k, v in chat_dic.items():\n";
    code += "        chat_flag = False\n";
    code += "        for word in v:\n";
    code += "            if word in request:\n";
    code += "                chat_flag = True\n";
    code += "            else:\n";
    code += "                chat_flag = False\n";
    code += "                break\n";
    code += "        if chat_flag:\n";
    code += "            return df['response'][k]\n";
    code += '    return -1\n';
    code += "print(chat(query))\n";

    final _result = await Chaquopy.executeCode(code);
    setState(() {
      _outputOrError = _result['textOutputOrError'] ?? '';
      _sendChatBotMessage();
    });
  }

  Future<void> _sendChatBotMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    final area = "청주";
    String sentence = "";
    print(_outputOrError.toString());

    if (_outputOrError.toString() == '0\n') {
      sentence = "안녕하세요 도모입니다";
    } else if (_outputOrError == '1\n') {
      sentence = area + " 현재 날씨는 ";
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
    } else if (_outputOrError == '2\n') {
      sentence = area + " 주변 관광지입니다";
    } else if (_outputOrError == '3\n') {
      sentence = "추천 감사합니다.\n최대한 빠르게 반영하겠습니다!";
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
                makePythonCode(_userEnterMessage.trim());
              },
              icon: Icon(Icons.send),
              color: Colors.blue,
            )
          ],
        ));
  }
}
