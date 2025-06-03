import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/Auto_Rental/screens/Location_Time/deliver.dart';
import 'package:flutter/material.dart';

class RentalDetailsScreen extends StatelessWidget {
  const RentalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rental Details"),backgroundColor: red,),
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.favorite, color: Colors.red),
                ],
              ),
            ),

            // Main Car Image
            Image.asset(
              'assets/images/home/audi_r8.png',
              height: 180,
              fit: BoxFit.contain,
            ),

            // Horizontal Gallery
            SizedBox(
              height: 70,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/home/super.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Title & Type
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chip(
                    label: Text("SUV"),
                    backgroundColor: Color(0xFFE0F0FF),
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 6),
                  Text("Mercedes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Tab Row
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("About", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text("More cars availability"),
                  Text("Reviews"),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Owner Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Meet the car owner", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rental Office Name", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Owner", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.chat_bubble_outline, color: Colors.blue),
                        const SizedBox(width: 10),
                        const Icon(Icons.call, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              SizedBox(width: 2),
                              Text("5.0", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Hello there! Welcome on board where you will find a peaceful ride for your journey. For any services available, feel free to contact me via my information mentioned.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),


          ],
        ),
      ),
                  // Price and Button
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: red,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  const Text("Price", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(width: 10),
                  const Text("PKR 7000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliverScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Book Now"),
                  )
                ],
              ),
            ),
    );
  }
}
