import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/Auto_Rental/screens/Location_Time/return.dart';
import 'package:flutter/material.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Location and Time",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Stepper
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildStepCircle(1, "Delivery", false),
                const Expanded(
                  child: Divider(color: redlight, thickness: 1),
                ),
                buildStepCircle(2, "Return", true),
                const Expanded(
                  child: Divider(color: redlight, thickness: 1),
                ),
                buildStepCircle(3, "Date/Time", true),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Delivery and Self Pick up buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              toggleButton("Delivery", true),
              const SizedBox(width: 10),
              toggleButton("Self Pick Up", false),
            ],
          ),

          const SizedBox(height: 20),

          // Location Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Choose your location",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.gps_fixed, color: redlight),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Map Image (Static Placeholder)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/home/map_placeholder.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Available locations list
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Available locations",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("F-10, Islamabad\nBuilding# 2 Office# 4\n+92 001 122 233"),
                  SizedBox(height: 12),
                  Text("F-10, Islamabad\nBuilding# 2 Office# 4\n+92 001 122 233"),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to next screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReturnScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Next", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  // Step circle builder
  Widget buildStepCircle(int step, String label, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: isActive ? red : redlight,
          child: Text(
            "$step",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : Colors.grey,
          ),
        )
      ],
    );
  }

  // Toggle button
  Widget toggleButton(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? owhite : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? red : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
