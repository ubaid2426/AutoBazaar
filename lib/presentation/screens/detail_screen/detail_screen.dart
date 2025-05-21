import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/widgets/date_availability.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: red,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text("Details", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/images/home/camaro.png'),
            ),
            const SizedBox(height: 12),

            // Thumbnails
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/home/audi_r8.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              "Auto Wash Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Auto Bazaar Shop",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              "Give your car the shine it deserves! Our premium auto wash...",
              style: TextStyle(color: Colors.black87),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BookingCalendarScreen(
                              reservedDates: [
                                DateTime(2025, 2, 16),
                                DateTime(2025, 2, 17),
                              ],
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: red),
                  child: const Text(
                    "Check Availability",
                    style: TextStyle(fontWeight: FontWeight.bold, color: white),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(onPressed: () {}, child: const Text("Book Now")),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Kuwait City",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/home/map.jpg'),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: red),
                    child: const Text(
                      "Get directions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Specifications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service Type",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Auto Wash"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Auto Type",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Car"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Brand",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("BMW-M Series"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Year",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("2020"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Governorate",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Kuwait"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Description\nAutomatic Auto Wash\nInterior and exterior wash\nWax and polish\nUnder body wash",
              ),
            ),

            const SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade200),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "AUTO BAZAAR SHOP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Kuwait City, Kuwait"),
                    Text("Member since 2020"),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: red),
                  child: const Text(
                    "Chat",
                    style: TextStyle(fontWeight: FontWeight.bold, color: white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Working Hours:"),
                Text("9:00 AM - 10:00 PM\nMonday - Sunday"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "KWD 25,000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: red),
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(fontWeight: FontWeight.bold, color: white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Looking to post your vehicle for sale?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: red),
                    child: const Text(
                      "Post Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 24),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text("Recommended", style: TextStyle(fontWeight: FontWeight.bold)),
            //     Text("View all", style: TextStyle(color: Colors.red))
            //   ],
            // ),
            // const SizedBox(height: 12),
            // SizedBox(
            //   height: 200,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     itemBuilder: (context, index) => Container(
            //       width: 140,
            //       margin: const EdgeInsets.only(right: 12),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: Colors.grey.shade100,
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // ClipRRect(
            //           //   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            //           //   child: Image.asset('assets/images/recommend_${index + 1}.jpg', height: 100, width: 140, fit: BoxFit.cover),
            //           // ),
            //           // const Padding(
            //           //   padding: EdgeInsets.all(8),
            //           //   child: Column(
            //           //     crossAxisAlignment: CrossAxisAlignment.start,
            //           //     children: [
            //           //       Text("Air Filters", style: TextStyle(fontWeight: FontWeight.bold)),
            //           //       Text("KWD 2000", style: TextStyle(color: Colors.black)),
            //           //     ],
            //           //   ),
            //           // )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
