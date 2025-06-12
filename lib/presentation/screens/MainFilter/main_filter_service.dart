// import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/components/body_type.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/components/fuel_filter_card.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/components/year_filter_card.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/main_filter.dart';
// import 'package:flutter/material.dart';
// class MainFilterService extends StatefulWidget {
//   final List<String>? items;
//     // final Map<String, dynamic>? items1;
//   const MainFilterService({super.key, this.items});

//   @override
//   State<MainFilterService> createState() => _MainFilterServiceState();
// }

// class _MainFilterServiceState extends State<MainFilterService> {
//   String selectedCondition = 'All';
//     final List<CheckBoxModel> featureOptions = [
//     CheckBoxModel(label: 'Sunroof'),
//     CheckBoxModel(label: 'ABS Brake'),
//     CheckBoxModel(label: 'Bluetooth'),
//     CheckBoxModel(label: 'Self-Drive'),
//     CheckBoxModel(label: 'Air Condition'),
//     CheckBoxModel(label: 'Super Charge'),
//     CheckBoxModel(label: 'AWD'),
//     CheckBoxModel(label: 'Parking Sensors'),
//     CheckBoxModel(label: 'GPS'),
//     CheckBoxModel(label: 'Climate Control'),
//     CheckBoxModel(label: 'Self-Parking'),
//   ];

//   final Set<String> _selectedFeatures = {};

//   final List<String> listingOptions = ['All', 'For sale', 'Wanted'];
//   final List<String> originOptions = [
//     'All',
//     'Local',
//     'Imported',
//     'GCC Spec',
//     'American Spec',
//     'Japanese Spec',
//     'European Spec',
//     'Other',
//   ];

//   void resetFilters() {
//     setState(() {
//       selectedCondition = 'All';
//       // Reset other filters too...
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filters'),
//         backgroundColor: red,
//         actions: [
//           TextButton(
//             onPressed: resetFilters,
//             child: const Text('Reset', style: TextStyle(color: black)),
//           ),
//         ],
//       ),
//       backgroundColor: white,
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildFeaturesTags(),
//           SizedBox(height: 30),
//           YearFilterWidget(),
//           SizedBox(height: 20),
//           FuelFilter(title: 'Car Origin', options: originOptions),
//           FuelFilter(
//             title: 'Regional specs',
//             options: regionalSpecifications,
//           ),
//           FuelFilter(title: 'Listing Type', options: listingOptions),
//           BodyTypeFilter(),
//         ],
//       ),
//     );
//   }

//   // Widget _buildFeaturesTags() {
//   //   return Wrap(
//   //     spacing: 8.0,
//   //     runSpacing: 8.0,
//   //     children:
//   //         featureOptions.map((feature) {
//   //           return FilterChip(
//   //             label: Text(feature.label),
//   //             selected: feature.isSelected,
//   //             onSelected: (isSelected) {
//   //               setState(() {
//   //                 feature.isSelected = isSelected;
//   //               });
//   //             },
//   //             selectedColor: Colors.blue.shade100,
//   //             backgroundColor: Colors.grey.shade200,
//   //             labelStyle: TextStyle(
//   //               color: feature.isSelected ? Colors.blue : Colors.black,
//   //               fontWeight:
//   //                   feature.isSelected ? FontWeight.bold : FontWeight.normal,
//   //             ),
//   //           );
//   //         }).toList(),
//   //   );
//   // }
//   Widget _buildFeaturesTags() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         // color: lightgrey,
//         decoration: BoxDecoration(
//           color: lightgrey,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             Text("Services Options", style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 18)),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children:
//                   widget.items!.map((feature) {
//                     final isSelected = _selectedFeatures.contains(feature);

//                     return FilterChip(
//                       label: Text(feature),
//                       selected: isSelected,
//                       onSelected: (bool selected) {
//                         setState(() {
//                           if (selected) {
//                             _selectedFeatures.add(feature);
//                           } else {
//                             _selectedFeatures.remove(feature);
//                           }
//                         });
//                       },
//                       selectedColor: redlight,
//                       backgroundColor: white,
//                       labelStyle: TextStyle(
//                         color: isSelected ? black : Colors.black,
//                         fontWeight:
//                             isSelected ? FontWeight.bold : FontWeight.normal,
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/body_type.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/fuel_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/year_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter.dart';
import 'package:flutter/material.dart';

class MainFilterService extends StatefulWidget {
  // final List<String>? items;
  // final List<String>? items;
  final Map<String, dynamic>? items;
  const MainFilterService({super.key, this.items});

  @override
  State<MainFilterService> createState() => _MainFilterServiceState();
}

class _MainFilterServiceState extends State<MainFilterService> {
  String selectedCondition = 'All';
  final List<CheckBoxModel> featureOptions = [
    CheckBoxModel(label: 'Sunroof'),
    CheckBoxModel(label: 'ABS Brake'),
    CheckBoxModel(label: 'Bluetooth'),
    CheckBoxModel(label: 'Self-Drive'),
    CheckBoxModel(label: 'Air Condition'),
    CheckBoxModel(label: 'Super Charge'),
    CheckBoxModel(label: 'AWD'),
    CheckBoxModel(label: 'Parking Sensors'),
    CheckBoxModel(label: 'GPS'),
    CheckBoxModel(label: 'Climate Control'),
    CheckBoxModel(label: 'Self-Parking'),
  ];

  final Set<String> _selectedFeatures = {};

  final List<String> listingOptions = ['All', 'For sale', 'Wanted'];
  final List<String> originOptions = [
    'All',
    'Local',
    'Imported',
    'GCC Spec',
    'American Spec',
    'Japanese Spec',
    'European Spec',
    'Other',
  ];

  void resetFilters() {
    setState(() {
      selectedCondition = 'All';
      // Reset other filters too...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        backgroundColor: red,
        actions: [
          TextButton(
            onPressed: resetFilters,
            child: const Text('Reset', style: TextStyle(color: black)),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildFeaturesTags(),
          SizedBox(height: 30),
          YearFilterWidget(),
          SizedBox(height: 20),
          FuelFilter(title: 'Car Origin', options: originOptions),
          FuelFilter(title: 'Regional specs', options: regionalSpecifications),
          FuelFilter(title: 'Listing Type', options: listingOptions),
          BodyTypeFilter(),
        ],
      ),
    );
  }

  Widget _buildFeaturesTags() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Services Options",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ...widget.items!.entries.map((entry) {
              final category = entry.key;
              final List<String> services = List<String>.from(entry.value);

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children:
                          services.map((service) {
                            final isSelected = _selectedFeatures.contains(
                              service,
                            );

                            return FilterChip(
                              label: Text(service),
                              selected: isSelected,
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedFeatures.add(service);
                                  } else {
                                    _selectedFeatures.remove(service);
                                  }
                                });
                              },
                              selectedColor: redlight,
                              backgroundColor: white,
                              labelStyle: TextStyle(
                                color: isSelected ? black : Colors.black,
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
