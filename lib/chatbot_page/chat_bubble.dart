import 'package:cosbe_domo/chatbot_page/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, {Key? key}) : super(key: key);
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe?
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        )
            :
        botchat(message: message),
      ],
    );
  }
}

class botchat extends StatefulWidget {
  const botchat({Key? key,required this.message}) : super(key: key);
  final String message;
  @override
  State<botchat> createState() => _botchatState();
}

class _botchatState extends State<botchat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset("assets/chat_assets/bot.png",width: 40,color:Color(0xff656CFF),),
        ),
        Container(
          width: ((){
            if(widget.message.length>20) return MediaQuery.of(context).size.width/10*6;
            else return MediaQuery.of(context).size.width/100*45;
          }()),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            widget.message,

            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
