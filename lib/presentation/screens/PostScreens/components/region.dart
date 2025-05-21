// car_year_screen.dart
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/state_area.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/transmission.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class RegionScreen extends StatefulWidget {
  final String category;
  const RegionScreen({super.key, required this.category});

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  List<String> filteredregion = regionalSpecifications;
  final TextEditingController _searchController = TextEditingController();
  Map<String, Widget Function()> categoryRoutes = {
    "Auto Sales": () => TransmissionScreen(),
    "Shop Services": () => StateArea(),
    // "Trucks": () => TruckDetailsScreen(),
    // Add more mappings
  };
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredregion =
          regionalSpecifications
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
      appBar: AppBar(title: Text("What are the regional specifications ?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose regional specifications"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for Region",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredregion.length,
                itemBuilder: (context, index) {
                  final year = filteredregion[index];
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
                        final nextScreenBuilder = categoryRoutes[widget.category];

                        if (nextScreenBuilder != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => nextScreenBuilder(),
                            ),
                          );
                        } else {
                          // Fallback or error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "No screen found for category: ${widget.category}",
                              ),
                            ),
                          );
                        }

                        // print(
                        //   "Selected Body Type: ${item["title"]} in category: ${widget.category}",
                        // );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
