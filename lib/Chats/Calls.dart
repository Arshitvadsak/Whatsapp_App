import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Chats/globals/allChats.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  int initialstap = 0;

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: allChats
              .map(
                (e) => GestureDetector(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("${e['image']}"),
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${e['name']}"),
                          Text("${e['desc']}"),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () async {
                            final call = Uri.parse('tel:${e['number']}');
                            if (await canLaunchUrl(call)) {
                              launchUrl(call);
                            }
                            else {
                             throw 'Could not launch $call';
                            }
                          },
                          icon: Icon(Icons.call),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
