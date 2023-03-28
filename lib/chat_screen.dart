import 'package:flutter/material.dart';
import 'package:flutterchatapp/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController  t1 = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

   void _handleSubmitted(String text)
  {
    t1.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message); 
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue,
      ),
      
      child: 
      Container(  
       margin: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
          decoration: InputDecoration(hintText: "Enter a message"),
          controller: t1,
          onSubmitted: _handleSubmitted,
           ),
          ),
          Container( 
            margin: EdgeInsets.only(left:5.0),
            child: 
            IconButton( onPressed: ()=>_handleSubmitted(t1.text) , icon:Icon(Icons.send) ), 
          ),
         ],
        ),
        
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
        children: [
          Expanded(
            child:  ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder:  (_,int index) => _messages[index],
              itemCount: _messages.length, 
              )
          ),

          Divider(
             height: 1.9,
          ),
          Container(
decoration: BoxDecoration(
  color: Theme.of(context).cardColor,
),
child: _textComposerWidget(),
          )
        ],
      );
  }
}