import 'chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  void _sendBaseMessage() {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text':
          "안녕하세요. 도모 챗봇입니다.\n저의 기능은 다음과 같습니다.\n1. 날씨를 받아보세요.\n2. 주변 관광지를 받아보세요.\n3. 여러분이 아는 여행지를 등록해주세요.\n감사합니다!",
      'time': Timestamp.now(),
      'userID': user!.uid + '/chatbot',
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            _sendBaseMessage();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = snapshot.data!.docs;
          List<QueryDocumentSnapshot<Map<String, dynamic>>> chat_doc = [];
          for (int i = 0; i < chatDocs.length; i++) {
            if (chatDocs[i]['userID'].toString() == user!.uid ||
                chatDocs[i]['userID'].toString() == user.uid + '/chatbot') {
              chat_doc.add(chatDocs[i]);
            }
          }
          return ListView.builder(
            reverse: true,
            itemCount: chat_doc.length,
            itemBuilder: (context, index) {
              return ChatBubble(chat_doc[index]['text'],
                  chat_doc[index]['userID'].toString() == user!.uid);
            },
          );
        });
  }
}
