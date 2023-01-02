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

class TabsDemo extends StatefulWidget {
  const TabsDemo({super.key});

  @override
  State<TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo> {
  int _selectedTab = 1;
  final String _title = "Selected Tab: ";
  String _fullTitle = "";

  @override
  void initState() {
    _fullTitle = _title + _selectedTab.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _selectedTab,
      child: Builder(builder: (BuildContext context) {
        final TabController controller = DefaultTabController.of(context);
        controller.addListener(() {
          if (!controller.indexIsChanging) {
            _selectedTab = controller.index;
            setState(() {
              _fullTitle = _title + _selectedTab.toString();
            });
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Tab 0"),
                Tab(text: "Tab 1"),
                Tab(text: "Tab 2"),
              ],
            ),
            title: Text(_fullTitle),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('View 0')),
              Center(child: Text('View 1')),
              Center(child: Text('View 2')),
            ],
          ),
        );
      }),
    );
  }
}
