import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GridView Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const ImageGridScreen(),
//     );
//   }
// }

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  final List<String> imagePaths = const [
    "assets/images/home/audi_r8.png",
    "assets/images/home/bmw_m3.png",
    "assets/images/home/mercedes_amg.png",
    "assets/images/home/tesla_model_s.png",
    "assets/images/home/lamborghini.png",
    "assets/images/home/ferrari.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Grid')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: imagePaths.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // Make square cards
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePaths[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}
