import 'package:domo/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  void _sendBaseMessage() {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': "Hello, I'm dOmO chatbot!",
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
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return ChatBubble(chatDocs[index]['text'],
                  chatDocs[index]['userID'].toString() == user!.uid);
            },
          );
        });
  }
}
