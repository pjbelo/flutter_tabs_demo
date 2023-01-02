import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TabsDemo(),
    );
  }
}

class TabsDemo extends StatelessWidget {
  const TabsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2, // remember the first is 0
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 0"),
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('View 0')),
            Center(child: Text('View 1')),
            Center(child: Text('View 2')),
          ],
        ),
      ),
    );
  }
}
