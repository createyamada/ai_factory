import 'package:flutter/material.dart';

List<Widget> contentWidgets = [];
String inputText = "";


class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPT();
}

class _ChatGPT extends State<ChatGPT> {

  addWidget(String message) {
    contentWidgets.add(meText(message));
    setState(() {});
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
                // <Widget>[
                  contentWidgets
                  // meText("私の出身大学は"),
                  // anotherText("東海大学政治経済学部")
                // ],
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
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
                ElevatedButton(
                  onPressed:() {
                    addWidget(inputText);
                  },
                  child: const Text('送信'),
                ),
              ],
            ));
  }
  
  // addWidget(String message) {
  //   contentWidgets.add(meText(message));
  //   setState(() {});
  // }
}
