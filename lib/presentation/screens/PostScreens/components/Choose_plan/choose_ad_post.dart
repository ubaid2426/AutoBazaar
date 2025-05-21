import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/choose_plan.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ad Plans',
//       theme: ThemeData(primarySwatch: Colors.brown),
//       home: ChooseAdPostTypeScreen(),
//     );
//   }
// }

class ChooseAdPostTypeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Basic",
      "price": "1000 PKR",
      "features": ["Valid for 30 days"],
    },
    {
      "title": "Pro",
      "price": "2000 PKR",
      "features": ["Valid for 30 days", "Featured on top 9 times"],
    },
    {
      "title": "Extra",
      "price": "5000 PKR",
      "features": [
        "Valid for 30 days",
        "Featured on top 5 times",
        "Pin in Toyota",
      ],
    },
    {
      "title": "Premium",
      "price": "7000 PKR",
      "features": [
        "Valid for 30 days",
        "Featured on top 9 times",
        "Pin in Toyota",
        "Featured Ad",
        "Pin in used cars (for the next 48 hours)",
      ],
    },
  ];

  ChooseAdPostTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose ad post type'), backgroundColor: red),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              plan["title"],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              plan["price"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ...plan["features"].map<Widget>(
                          (f) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                Icon(Icons.access_time, size: 16),
                                SizedBox(width: 6),
                                Expanded(child: Text(f)),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Select',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: redlight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoosePlanScreen()),
                );
              },
              child: Text('Next', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: red,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
