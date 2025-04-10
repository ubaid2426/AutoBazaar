import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/models/showroom_model.dart';

class ShowroomCard extends StatelessWidget {
  final Showroom showroom;

  const ShowroomCard({super.key, required this.showroom});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Card background color
        border: Border(
          left: BorderSide(color: red, width: 5), // Left border
          // bottom: BorderSide(color: red, width: 5), // Bottom border
        ),
        borderRadius: BorderRadius.circular(12), // Optional: Rounded corners
      ),
      child: Card(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // Logo
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  showroom.logoUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),

              // Info section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Showroom name
                    Text(
                      showroom.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),

                    // City name
                    Text(
                      showroom.city,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),

                    // Rating and Auto Count
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          showroom.rating.toStringAsFixed(1),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.directions_car,
                          size: 14,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${showroom.autoCount} autos',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
