import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Home/Screens/auto_sales.dart';
import 'package:flutter/material.dart';

class AutoClassified extends StatefulWidget {
  const AutoClassified({super.key});

  @override
  State<AutoClassified> createState() => _AutoClassifiedState();
}

class _AutoClassifiedState extends State<AutoClassified>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic height based on the number of carousel rows
        double heightPerRow = 400; // Height of one row
        int numberOfRows = 1; // Default to 1 row

        // If two carousels need to be displayed, adjust height
        if (carList.length >15) {
          numberOfRows = 2;
        }

        double totalHeight = heightPerRow * numberOfRows - 50;

        return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(3, 4),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 120, 118, 118),
                blurRadius: 10,
                offset: Offset(-3, -3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Explore Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      color: Colors.black87,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red,
                      foregroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Shop Now →"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Auto Classified",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Tab Bar
              Center(
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(child: Text("Auto \nSales", textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
                      Tab(child: Text("Auto Shops \nServices", textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
                      Tab(child: Text("Auto \nRental", textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
                      Tab(child: Text("Auto \nWanted", textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
                    ],
                  ),
                ),
              ),

              // Use Flexible to allow dynamic height
              SizedBox(
                height: totalHeight, // Adjust height dynamically
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AutoSales(title: 'Vehicles', carList: carList,),
                    _buildTabContent("Auto Shops & Services Content"),
                    _buildTabContent("Auto Rental Content"),
                    _buildTabContent("Auto Wanted Content"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper function for content
  Widget _buildTabContent(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
