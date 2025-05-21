// import 'dart:math';

// import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Horizontal_Filter/components/body_type.dart';
import 'package:autobazzaar/presentation/screens/Horizontal_Filter/components/color_filter.dart';
import 'package:autobazzaar/presentation/screens/Horizontal_Filter/components/price_filter.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/main_filter_service.dart';
// import 'package:autobazzaar/presentation/screens/MainFilter/components/price_filter.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/bodytype.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:autobazzaar/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class HorizontalFilter extends StatefulWidget {
  final String type;
  const HorizontalFilter({super.key, required this.type});

  @override
  State<HorizontalFilter> createState() => _HorizontalFilterState();
}

class _HorizontalFilterState extends State<HorizontalFilter> {
  final List<String> options = ['All', 'New', 'Used'];
  final List<String> licenseOptions = ['All', 'Licensed', 'Not Licensed'];
  final List<String> customsOptions = ['All', 'Customs', 'Not Customs'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainFilterScreen(type: widget.type,)),
                );
              },
              child: SizedBox(
                width: 45,
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                    // color: redlight, // Main container background
                    border: Border.all(color: red),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.filter_alt_sharp),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 70,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  FilterButton(
                    title: 'Conditions',
                    filter: true,
                    items: [],
                    options: options,
                    multiseslect: true,
                  ),
                  //  FilterButton(
                  //   title: 'Auto Type',
                  //   filter: true,
                  //   items: [],
                  //   options: autoTypes,
                  //   multiseslect: true,
                  // ),
                  FilterButton(
                    title: 'Car Make',
                    filter: true,
                    items: [],
                    options: [],
                    multiseslect: false,
                    navigate: BrandScreen(type: widget.type, filteruse: true,),
                  ),
                  // FilterButton(
                  //   title: 'Models',
                  //   filter: true,
                  //   items: [],
                  //   options: [],
                  // ),
                  FilterButton(
                    title: 'Trim',
                    filter: true,
                    items: [],
                    options: [],
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Year',
                    filter: true,
                    items: [],
                    options: yearspost,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Number of Seats',
                    filter: true,
                    items: [],
                    options: carSeats,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Fuels',
                    filter: true,
                    items: [],
                    options: fuel,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Car License',
                    filter: true,
                    items: [],
                    options: licenseOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Insurance',
                    filter: true,
                    items: [],
                    options: insurance,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Car Custom',
                    filter: true,
                    items: [],
                    options: customsOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Payment Method',
                    filter: true,
                    items: [],
                    options: payment,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Car Origin',
                    filter: true,
                    items: [],
                    options: originOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Regional Specs',
                    filter: true,
                    items: [],
                    options: regionalSpecifications,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Listing Type',
                    filter: true,
                    items: [],
                    options: listingOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Transmission',
                    filter: true,
                    items: [],
                    options: transmission,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Body Type',
                    filter: true,
                    items: [],
                    options: [],
                    navigate: BodyTypeFilter(category: "Auto Sales"),
                    multiseslect: false,
                  ),
                  FilterButton(
                    title: 'Price',
                    filter: true,
                    items: [],
                    options: [],
                    multiseslect: false,
                    navigate: Material(child: Center(child: PriceHFilter())),
                  ),
                  FilterButton(
                    title: 'Kilometer',
                    filter: true,
                    items: [],
                    options: kilometerRanges,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Interior Options',
                    filter: true,
                    items: [],
                    options: interiorOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Exterior Options',
                    filter: true,
                    items: [],
                    options: exteriorOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Exterior Color',
                    filter: true,
                    items: [],
                    options: [],
                    navigate: ColorHFilter(),
                    //  navigate: ColorFilter(),
                    multiseslect: false,
                  ),
                  FilterButton(
                    title: 'Interior Color',
                    filter: true,
                    items: [],
                    options: [],
                    navigate: ColorHFilter(),
                    multiseslect: false,
                  ),
                  FilterButton(
                    title: 'Engine Size cc',
                    filter: true,
                    items: [],
                    options: engineSizesCC,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Battery Capacity',
                    filter: true,
                    items: [],
                    multiseslect: true,
                    options: batteryCapacities,
                  ),
                  FilterButton(
                    title: 'Battery Range',
                    filter: true,
                    items: [],
                    options: batteryRanges,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Technology Options',
                    filter: true,
                    items: [],
                    options: carTechnologyOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Body Condition',
                    filter: true,
                    items: [],
                    options: condition,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Paint',
                    filter: true,
                    items: [],
                    options: repainted,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Other Options',
                    filter: true,
                    items: [],
                    options: otherOptions,
                    multiseslect: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
