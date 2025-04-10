import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/seats.dart';
import 'package:flutter/material.dart';

class BodyTypeScreen extends StatelessWidget {


   BodyTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What is the Body type?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text("Choose the body type of the car"),
            ]),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeatsScreen(),
                            ),
                          );
                        // Handle body type selection
                        print("Selected: ${item["title"]}");
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
