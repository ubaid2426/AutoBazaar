// import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/data/models/dummy_autopart.dart';
// import 'package:autobazzaar/models/product.dart';
// import 'package:autobazzaar/models/vehicle_category.dart';
// import 'package:autobazzaar/presentation/screens/AutoParts/components/autopart_subcategory.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
// import 'package:autobazzaar/presentation/widgets/product_widget.dart';
// import 'package:flutter/material.dart';

// class AutopartCar extends StatelessWidget {
//   final String selectedVehicleType;
//   AutopartCar({super.key, required this.selectedVehicleType});

//   final Map<String, Map<String, dynamic>> vehicleTypeData = {
//     "Car": {
//       "categories": carCategories,
//       "sections": ["Auto Spare Parts", "Auto Accessories", "Auto Body Parts"],
//       "products": carcategory1,
//     },
//     "Motor bike": {
//       "categories": motorbikeCategories,
//       "sections": ["Bike Spare Parts", "Bike Accessories", "Bike Body Panels"],
//       "products": motorbikeCategory,
//     },
//     "3-Wheeler": {
//       "categories": threeWheelerCategories,
//       "sections": [
//         "Rickshaw Mechanical Parts",
//         "Interior Accessories",
//         "Body Frames & Panels",
//       ],
//       "products": threeWheelerCategory,
//     },
//     "Van": {
//       "categories": vanCategories,
//       "sections": [
//         "Van Spare Parts",
//         "Van Interior Kits",
//         "Van Body Components",
//       ],
//       "products": vanCategory,
//     },
//     "Taxi": {
//       "categories": taxiCategories,
//       "sections": [
//         "Engine & Suspension Parts",
//         "Taxi Gadgets & Meters",
//         "Body Maintenance Parts",
//       ],
//       "products": taxiCategory,
//     },
//     "Bus": {
//       "categories": busCategories,
//       "sections": [
//         "Bus Mechanical Parts",
//         "Passenger Comfort Accessories",
//         "Bus Body Panels",
//       ],
//       "products": busCategory,
//     },
//     "Lorry": {
//       "categories": lorryCategories,
//       "sections": [
//         "Heavy-Duty Engine Parts",
//         "Truck Cabin Accessories",
//         "Truck Body Panels & Bumpers",
//       ],
//       "products": truckCategory,
//     },
//     "Quad/Buggy": {
//       "categories": quadCategories,
//       "sections": [
//         "ATV Suspension & Drivetrain",
//         "Off-road Accessories",
//         "Protective Body Covers",
//       ],
//       "products": atvCategory,
//     },
//     "RV/Camper van": {
//       "categories": camperVanCategories,
//       "sections": [
//         "RV Electrical & Plumbing Parts",
//         "Camping Accessories",
//         "Exterior Body Fittings",
//       ],
//       "products": camperCategory,
//     },
//     "Water Crafts": {
//       "categories": waterCraftCategories,
//       "sections": [
//         "Marine Engine Parts",
//         "Navigation Accessories",
//         "Boat Body Components",
//       ],
//       "products": waterCraftCategory,
//     },
//   };

//   @override
//   Widget build(BuildContext context) {
//     final vehicleData = vehicleTypeData[selectedVehicleType];

//     if (vehicleData == null) {
//       return const Scaffold(
//         body: Center(child: Text("No data found for this vehicle type")),
//       );
//     }

//     final List<VehicleCategory> categories =
//         vehicleData["categories"] as List<VehicleCategory>;
//     final List<String> sections = vehicleData["sections"] as List<String>;
//     final Map<String, List<Product>> products =
//         vehicleData["products"] as Map<String, List<Product>>;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$selectedVehicleType Parts"),
//         backgroundColor: red,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Vehicle Category Grid
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: VehicleGridPager(
//                 height: 150,
//                 page: categories,
//                 onCategoryTap: (category) {

//                       Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => AutoPartsSubCategory(autotype: selectedVehicleType, category: category.name)
//                               ),
//                             );
//                   // Implement navigation if needed
//                 }, count: 3, ratio: 1.2, svg: false,
//               ),
//             ),


//             // Product Sections with data
//             ...sections.map((section) {
//               final sectionProducts = products[section] ?? [];
//               return ProductCardSection(
//                 category: section,
//                 products: sectionProducts,
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }







// // import 'package:flutter/material.dart';
// // import 'package:autobazzaar/models/product.dart';
// // import 'package:autobazzaar/presentation/widgets/product_widget.dart';

// class SectionProductScreen extends StatelessWidget {
//   final String sectionTitle;
//   final List<Product> products;

//   const SectionProductScreen({
//     Key? key,
//     required this.sectionTitle,
//     required this.products,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(sectionTitle),
//         backgroundColor: Colors.red,
//       ),
//       body: products.isEmpty
//           ? const Center(child: Text("No products available"))
//           : ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 return ProductCard(product: products[index]);
//               },
//             ),
//     );
//   }
// }



import 'dart:convert';
import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/AutoParts/auto_parts_sub_category.dart';
import 'package:autobazzaar/presentation/screens/AutoParts/components/autopart_subcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutopartCar extends StatelessWidget {
  final String autotype;
  final String name;
  final String namesub;
  const AutopartCar({super.key, required this.autotype, required this.name, required this.namesub});

  Future<Map<String, dynamic>> _loadAutoPartsData() async {
    final String path = 'assets/json/auto_parts/car/car_data.json'; // Adjust path if needed
    final String jsonStr = await rootBundle.loadString(path);
    final Map<String, dynamic> decoded = json.decode(jsonStr);
    print(decoded);
    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(location: "Kuwait", backarrow: true),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PromoCarousel(promoList: promoCards),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Browse Auto Parts Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<Map<String, dynamic>>(
                    future: _loadAutoPartsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData || snapshot.hasError) {
                        return const Center(child: Text("Failed to load data"));
                      }

                      final data = snapshot.data!;
                      final categories = data.keys.toList();

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final iconPath = "assets/images/icon/${category.replaceAll(" ", "_").toLowerCase()}.svg";

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AutoPartsSubCategory(
                                      autotype: autotype,
                                      category: category, ispost: false, name: name, namesub: namesub,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 6,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      iconPath,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    category,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
