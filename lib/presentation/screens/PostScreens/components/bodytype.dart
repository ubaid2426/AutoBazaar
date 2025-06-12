import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/shop_service.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/seats.dart';
import 'package:flutter/material.dart';

class BodyTypeScreen extends StatefulWidget {
  final String category;
  final String autotype;
  const BodyTypeScreen({super.key, required this.category, required this.autotype});

  @override
  State<BodyTypeScreen> createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  Map<String, Widget Function()> categoryRoutes = {
    "Auto Sales": () => SeatsScreen(),
    "Shop Services": () => AutoServicePost(autotype: widget.autotype,),
    // "Trucks": () => TruckDetailsScreen(),
    // Add more mappings
  };

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
