import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AutoClassifiedScreen(),
    );
  }
}

class AutoClassifiedScreen extends StatefulWidget {
  @override
  _AutoClassifiedScreenState createState() => _AutoClassifiedScreenState();
}

class _AutoClassifiedScreenState extends State<AutoClassifiedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Classified"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: "Auto Sales"),
                  Tab(text: "Auto Rental"),
                  Tab(text: "Auto Wanted"),
                  Tab(text: "Auto Services"),
                  Tab(text: "Auto Parts"),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Auto Sales Content")),
          Center(child: Text("Auto Rental Content")),
          Center(child: Text("Auto Wanted Content")),
          Center(child: Text("Auto Services Content")),
          Center(child: Text("Auto Parts Content")),
        ],
      ),
    );
  }
}
