import 'package:flutter/material.dart';

import 'globals/allChats.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: allChats
            .map(
              (e) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("${e['image']}"),
                        //  backgroundColor: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${e['name']}"),
                          Text("${e['desc']}"),
                        ],
                      ),
                      Spacer(),
                      Text("${e['time']}"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
