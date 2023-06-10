import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../secret.dart';

List<Widget> contentWidgets = [];
String inputText = "";
String? resText;
bool buttonState = false;


class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPT();
}

class _ChatGPT extends State<ChatGPT> {

  final controller = TextEditingController();

  addWidget(String message) async {
    buttonState = true;
    setState(() {});
    contentWidgets.add(meText(message));
    await sendToChatGPT(message);
    contentWidgets.add(anotherText(resText.toString()));
    buttonState = false;
    setState(() {});
  }

  // Future<void> sendToChatGPT(String message) async {
  Future<void> sendToChatGPT(String message) async {
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

    final jsonResponse 
    
    = jsonDecode(utf8.decode(response.body.codeUnits))
        as Map<String, dynamic>;

     resText =
        (jsonResponse['choices'] as List).first['message']['content'] as String;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var contentWidgets = _makeWidgets();
    // List<Widget> contentWidgets = [];
    // String inputText = "テスト満";
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT'),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          // Spacer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: Column(
                children: 
                  contentWidgets
              ),
            )
          ),
          textInputWidget(),
        ],
      )),
    );
  }

  List<Widget> _makeWidgets() {
    var contentWidgets = <Widget>[];
    return contentWidgets;
  }

  Padding anotherText(String message) {
    return Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        // child: Image.asset(''),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(message),
                        ),
                      )
                    ],
                  ),
                );
  }

  Padding meText(String message) {
    return Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                        gradient: LinearGradient(
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                          colors: [
                            const Color.fromARGB(230, 130 , 153 ,250),
                            const Color.fromARGB(250, 132 , 199 , 250),
                          ],
                          stops: const [
                            0.0,
                            1.0,
                          ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
  }

  Container textInputWidget() {
    return Container(
            height: 68,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                  iconSize: 28,
                  color: Colors.black54,
                ),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40)
                    ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
                ElevatedButton(
                  onPressed: buttonState ? null : () {
                    addWidget(controller.text);
                  },
                  child: const Text('送信'),
                ),
              ],
            ));
  }
}
