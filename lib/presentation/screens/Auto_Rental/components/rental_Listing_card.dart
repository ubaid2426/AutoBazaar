import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String type;
  final double rating;
  final String price;
  final String transmission;
  final String fuel;
  final String seats;
  final bool isFavorite;

  const CarCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.rating,
    required this.price,
    required this.transmission,
    required this.fuel,
    required this.seats,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(price, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
               Divider(color: Colors.grey.shade300),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: const [
                      Icon(Icons.settings, size: 16),
                      SizedBox(width: 4),
                      Text("Automatic", style: TextStyle(fontSize: 12))
                    ]),
                    Row(children: const [
                      Icon(Icons.local_gas_station, size: 16),
                      SizedBox(width: 4),
                      Text("Fuel", style: TextStyle(fontSize: 12))
                    ]),
                    Row(children: const [
                      Icon(Icons.event_seat, size: 16),
                      SizedBox(width: 4),
                      Text("5 seats", style: TextStyle(fontSize: 12))
                    ]),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
