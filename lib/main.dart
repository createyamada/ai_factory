import 'dart:convert';

import 'package:ai_factory/secret.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

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
 
  String? content;

  final controller = TextEditingController();

  Future<void> sendToChatGPT() async {
    final response = await post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $API_KEY',
        'Content-Type': 'application/json',
        // 'OpenAI-Organization': 'org-3kJ8f2NS5osyB5W4JgEzVpha',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": controller.text,
          }
        ],
      }),
    );

    final jsonResponse = jsonDecode(utf8.decode(response.body.codeUnits))
        as Map<String, dynamic>;

    content =
        (jsonResponse['choices'] as List).first['message']['content'] as String;
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            TextFormField(
              controller: controller,
            ),
            if (content == null) const Text('結果はまだありません') else Text(content!),
            ElevatedButton(
              onPressed: () {
                sendToChatGPT();
              },
              child: const Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}

