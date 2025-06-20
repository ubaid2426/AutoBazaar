import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/region.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/seats.dart';
import 'package:flutter/material.dart';

class BodyTypeFilter extends StatefulWidget {
  final String category;

  const BodyTypeFilter({super.key, required this.category});

  @override
  State<BodyTypeFilter> createState() => _BodyTypeFilterState();
}

class _BodyTypeFilterState extends State<BodyTypeFilter> {
  // Map<String, Widget Function()> categoryRoutes = {
  //   "Auto Sales": () => SeatsScreen(),
  //   "Shop Services": () => RegionScreen(category: 'Shop Services',),
  //   // "Trucks": () => TruckDetailsScreen(),
  //   // Add more mappings
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What is the Body type?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose the body type of the car"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for Body Type",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bodyTypes.length,
                itemBuilder: (context, index) {
                  final item = bodyTypes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item["image"],
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        item["title"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pop(context);
                        // final nextScreenBuilder = categoryRoutes[widget.category];

                        // if (nextScreenBuilder != null) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => nextScreenBuilder(),
                        //     ),
                        //   );
                        // } else {
                        //   // Fallback or error
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(
                        //         "No screen found for category: ${widget.category}",
                        //       ),
                        //     ),
                        //   );
                        // }

                        print(
                          "Selected Body Type: ${item["title"]} in category: ${widget.category}",
                        );
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
