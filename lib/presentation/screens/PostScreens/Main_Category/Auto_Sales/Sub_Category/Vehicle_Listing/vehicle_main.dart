import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/car_post_ad.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/widgets/cetagory_design.dart';
import 'package:flutter/material.dart';
// import 'vehicle_category.dart';
// import 'vehicle_category_box.dart';

class VehicleSelectionScreen extends StatelessWidget {
  final String name;
  final String namesub;
  const VehicleSelectionScreen({super.key, required this.namesub, required this.name});

  @override
  Widget build(BuildContext context) {
    // print(name);
    print(namesub);
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle Type"),
        centerTitle: true,
        backgroundColor: redlight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: dummyVehicleCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            childAspectRatio: 1, // Square boxes
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final selectedCategory = dummyVehicleCategories[index];
            return VehicleCategoryBox(
              category: selectedCategory,
              onTap: () {
                // Handle category selection
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => CarPostAdScreen(
                          title: selectedCategory.name,
                           namesub: namesub, name: name, type: selectedCategory.name,
                        ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
