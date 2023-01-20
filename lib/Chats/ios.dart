import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals/allChats.dart';

class IOS extends StatefulWidget {
  const IOS({Key? key}) : super(key: key);

  @override
  State<IOS> createState() => _IOSState();
}

class _IOSState extends State<IOS> {
  bool switch1 = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.phone),
          middle: Text("Chats"),
          trailing: CupertinoSwitch(
              value: switch1,
              onChanged: (val) {
                setState(() {
                  // val = switch1;
                  switch1 = val;
                });
              }),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.search),
                      SizedBox(width: 10),
                      Text(
                        "Search",
                        style: TextStyle(
                            color: CupertinoColors.darkBackgroundGray,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.inactiveGray,
                ),
              ),
              SizedBox(height: 10),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
