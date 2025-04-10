// car_year_screen.dart
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/bodycondition.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/excolor.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class RepaintScreen extends StatefulWidget {
  const RepaintScreen({super.key});

  @override
  _RepaintScreenState createState() => _RepaintScreenState();
}

class _RepaintScreenState extends State<RepaintScreen> {
  List<String> filteredtransmission = repainted;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredtransmission =
          repainted
              .where((year) => year.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Did the Car get Repainted?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RepaintScreen()),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text("Choose the paint condition of the car you want to sell"),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for ...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredtransmission.length,
                  itemBuilder: (context, index) {
                    final year = filteredtransmission[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          year,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BodyCondition(),
                            ),
                          );
                          // Handle year selection
                          print("Selected region: $year");
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
