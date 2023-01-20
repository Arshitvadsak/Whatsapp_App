import 'package:flutter/material.dart';
import 'Chats/Calls.dart';
import 'Chats/Chats.dart';
import 'Chats/Status.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _homePageState();
}

class _homePageState extends State<MyApp> with SingleTickerProviderStateMixin {
  List list = [
    "Chats",
    "Status",
    "Calls",
  ];
  late TabController controller;

  int page = 0;
  bool switch1 = false;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: DrawerPage(),
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Switch(
              value: switch1,
              onChanged: (val) {
                setState(() {
                  switch1 = val;
                });
              }),
          Icon(Icons.camera_alt_outlined),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          //  indicator: BoxDecoration(),
          tabs: list
              .map(
                (e) => Tab(
                  text: e,
                  // style: TextStyle(fontSize: 22),
                ),
              )
              .toList(),
        ),
        backgroundColor: Colors.teal,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const Padding(
            padding: const EdgeInsets.all(10),
             child: Chats(),
          ),
          Container(
             child: Status(),
            // color: Colors.amber,
            alignment: Alignment.center,
          ),
          Container(
                child: Calls(),
              ),
        ],
      ),
    );
  }
}
