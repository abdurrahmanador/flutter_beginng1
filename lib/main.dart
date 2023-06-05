import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = TabController(length: 3, vsync: this);
    _currentPageIndex.animation!.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _currentPageIndex.animation!.removeListener(_handleTabChange);
    _currentPageIndex.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("PAGES"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Page: 01'),
              onTap: () {
                setState(() {
                  _currentPageIndex.index = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('Page: 02'),
              onTap: () {
                setState(() {
                  _currentPageIndex.index = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('Page: 03'),
              onTap: () {
                setState(() {
                  _currentPageIndex.index = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _currentPageIndex,
        children: [
          Center(
            child: Text(
              "Page 01",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Text(
              "Page 02",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Text(
              "Page 03",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _currentPageIndex,
        tabs: [
          Tab(
            icon: Icon(Icons.calculate),
            text: "Page 1",
          ),
          Tab(
            icon: Icon(Icons.accessibility),
            text: "Page 2",
          ),
          Tab(
            icon: Icon(Icons.access_alarm),
            text: "Page 3",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: _currentPageIndex.index == 0
            ? Icon(Icons.add, color: Colors.red)
            : _currentPageIndex.index == 1
            ? Icon(Icons.edit, color: Colors.grey)
            : Icon(Icons.delete, color: Colors.white),
        backgroundColor: _currentPageIndex.index == 0
            ? Colors.amber
            : _currentPageIndex.index == 1
            ? Colors.yellow
            : Colors.cyanAccent,
      ),

    );
  }

}

