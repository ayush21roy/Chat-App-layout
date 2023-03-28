import 'package:flutter/material.dart';
import 'package:flutterchatapp/chat_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("CHAT APP"),
      ),
      body: new ChatScreen(),
    );
  }
}