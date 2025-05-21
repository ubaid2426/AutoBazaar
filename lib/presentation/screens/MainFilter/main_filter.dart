// import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/OtherOptionsWidget.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/body_type.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/car_make_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/color_filter.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/condition_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/fuel_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/seats_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/transmission_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/year_filter_card.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/kilometer_filter.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/components/price_filter.dart';
import 'package:flutter/material.dart';

// import 'widgets/condition_filter_card.dart';
// import all other cards...
class CheckBoxModel {
  String label;
  bool isSelected;

  CheckBoxModel({required this.label, this.isSelected = false});
}

class MainFilterScreen extends StatefulWidget {
  final String? type;
  const MainFilterScreen({super.key, this.type});

  @override
  State<MainFilterScreen> createState() => _MainFilterScreenState();
}

class _MainFilterScreenState extends State<MainFilterScreen> {
  String selectedCondition = 'All';

  // Add other selected values like selectedMake, selectedYear, etc.
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
  final List<String> fuelOptions = [
    'All',
    'Diesel',
    'Electric',
    'Gasoline',
    'Hybrid',
    'Mild Hybrid',
    'Plug-in - Hybrid',
  ];
  final List<String> licenseOptions = ['All', 'Licensed', 'Not Licensed'];
  final List<String> customsOptions = ['All', 'Customs', 'Not Customs'];
  final List<String> listingOptions = ['All', 'For sale', 'Wanted'];
  List<Map<String, dynamic>> carColors = [
    {"name": "Baby Blue", "color": Colors.lightBlueAccent},
    {"name": "Beige", "color": Color(0xFFF5F5DC)},
    {"name": "Black", "color": Colors.black},
    {"name": "Blue", "color": Colors.blue},
    {"name": "Bronze", "color": Color(0xFFCD7F32)},
    {"name": "Brown", "color": Colors.brown},
    {"name": "Gold", "color": Color(0xFFFFD700)},
    {"name": "Green", "color": Colors.green},
    {"name": "Grey", "color": Colors.grey},
    {"name": "Orange", "color": Colors.orange},
    {"name": "Pink", "color": Colors.pink},
    {"name": "Purple", "color": Colors.purple},
    {"name": "Red", "color": Colors.red},
    {"name": "Silver", "color": Color(0xFFC0C0C0)},
    {"name": "White", "color": Colors.white},
    {"name": "Yellow", "color": Colors.yellow},
    {"name": "Other", "color": Colors.transparent},
  ];
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
  String? selectedAutoType;
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
          ConditionFilterCard(
            selected: selectedCondition,
            onChanged: (val) => setState(() => selectedCondition = val),
          ),

          // Add other filter cards here
          FuelFilter(
            title: 'Auto Type',
            // selectedFuel: autoTypes,
            // onChanged: (value) {
            //   setState(() {
            //     selectedAutoType = value;
            //   });
            // },
            options: autoTypes,
            onSelected: (String value) {
              setState(() {
                selectedAutoType = value;
              });
            }, selectedFuel: selectedAutoType??"Car",
          ),
          CarMakeFilter(type: selectedAutoType??"Car"),
          SizedBox(height: 30),
          YearFilterWidget(),
          SizedBox(height: 20),
          SeatsFilter(),
          SizedBox(height: 20),
          FuelFilter(title: 'Fuel', options: fuelOptions),
          FuelFilter(title: 'Car License', options: licenseOptions),
          FuelFilter(title: 'Insurance', options: insurance),
          FuelFilter(title: 'Car Customs', options: customsOptions),
          FuelFilter(title: 'Payment Method', options: payment),
          FuelFilter(title: 'Car Origin', options: originOptions),
          FuelFilter(
            title: 'Regional specs',
            options: regionalSpecifications,
          ),
          FuelFilter(title: 'Listing Type', options: listingOptions),
          // SizedBox(height: 20),
          TransmissionFilter(),
          BodyTypeFilter(),
          PriceFilter(),
          SizedBox(height: 20),
          KilometerFilter(),
          _buildFeaturesTags(),
          ColorSelectionSection(
            title: "Exterior Color",
            colors: carColors,
            // onMorePressed: () {
            //   // handle more exterior color tap
            // },
          ),
          ColorSelectionSection(
            title: "Interior Color",
            colors: carColors,
            // onMorePressed: () {
            //   // handle more interior color tap
            // },
          ),
          OtherOptionsWidget(),
        ],
      ),
    );
  }

  // Widget _buildCheckboxList(List<CheckBoxModel> options) {
  //   return Wrap(
  //     spacing: 10.0,
  //     children:
  //         options.map((option) {
  //           return FilterChip(
  //             label: Text(option.label),
  //             selected: option.isSelected,
  //             onSelected: (value) {
  //               setState(() {
  //                 option.isSelected = value;
  //               });
  //             },
  //           );
  //         }).toList(),
  //   );
  // }

  Widget _buildFeaturesTags() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          featureOptions.map((feature) {
            return FilterChip(
              label: Text(feature.label),
              selected: feature.isSelected,
              onSelected: (isSelected) {
                setState(() {
                  feature.isSelected = isSelected;
                });
              },
              selectedColor: Colors.blue.shade100,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: feature.isSelected ? Colors.blue : Colors.black,
                fontWeight:
                    feature.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
    );
  }
}
