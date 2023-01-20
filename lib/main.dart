import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Chats/Calls.dart';
import 'Chats/Chats.dart';
import 'Chats/Status.dart';
import 'Chats/ios.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
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
      // drawer: DrawerPage(),
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
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.search_rounded),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.more_vert),
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
            child: const Status(),
            // color: Colors.amber,
            alignment: Alignment.center,
          ),
          Container(
            child: const Calls(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IOS(),
            ),
          );
        },
        child: const Icon(Icons.message),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
