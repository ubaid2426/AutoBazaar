// car_year_screen.dart
import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/excolor.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/repaint.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class SeatsScreen extends StatefulWidget {
  const SeatsScreen({super.key});

  @override
  _SeatsScreenState createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<String> filteredtransmission = carSeats;
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
          carSeats
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
      appBar: AppBar(title: Text("How many seats?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeatsScreen()),
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
                  Text("Choose the number of car seats"),
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
                              builder: (context) => RepaintScreen(),
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
