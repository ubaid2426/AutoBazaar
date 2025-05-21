import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/years.dart';
import 'package:flutter/material.dart';

class ModelScreen extends StatelessWidget {
  final String brand;
  final List<String> models;
  final IconData icon;
  final bool? filteruse;
  const ModelScreen({
    super.key,
    required this.brand,
    required this.models,
    required this.icon,
   required this.filteruse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Models of $brand",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: redlight,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (filteruse == true) {
                         Navigator.pop(context);
              }
              else{
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YearScreen()),
                );
              }
            },
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Icon(icon, color: red),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        models[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Icon(Icons.arrow_forward_ios, size: 28, color: red),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
