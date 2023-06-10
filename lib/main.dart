import 'package:ai_factory/page/chatGPT_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: openChatGPT()
    );
  }
}

class openChatGPT extends StatefulWidget {
  const openChatGPT({super.key});

  @override
  State<openChatGPT> createState() => _openChatGPT();
}

class _openChatGPT extends State<openChatGPT> {
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
   
            Text("AIどんどん使ってこうぜ！！"),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatGPT(),
                  ));

              },
              child: const Text('ChatGPT（自動文字生成）を利用する'),
            ),
           ElevatedButton(
              onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatGPT(),
                  ));

              },
              child: const Text('STABLEDEFFUSION（自動画像生成）を利用する'),
            ),
          ],
        ),
      ),
    );
  }
}

