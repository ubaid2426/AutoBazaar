import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/Profile/payment.dart';
// import 'package:autobazzaar/src/credit_card_form.dart';
import 'package:flutter/material.dart';

class ChoosePlanScreen extends StatelessWidget {
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Standard",
      "price": "1000 PKR",
      "features": ["Live for 30 days"],
    },
    {
      "title": "Premium",
      "price": "2000 PKR",
      "features": ["Live for 30 days", "Refreshed to 1st place (every 8 days)"],
    },
    {
      "title": "Optimum",
      "price": "7000 PKR",
      "features": [
        "Valid for 30 days",
        "Highest views",
        "Pin in Toyota",
        "Featured Ad",
        "Refreshed to 1st place (every 3 days)",
      ],
    },
  ];

  ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Plan'), backgroundColor: red),
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: redlight,
                            ),
                            child: Text(
                              'Select',
                              style: TextStyle(color: Colors.white),
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
                  MaterialPageRoute(builder: (context) => PaymentMethod()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Next', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
