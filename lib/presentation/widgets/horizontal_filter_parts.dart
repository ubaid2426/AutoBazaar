import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter_service.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/bodytype.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/payment.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/state_area.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/working_hours1.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/years.dart';
import 'package:autobazzaar/presentation/widgets/button.dart';
import 'package:autobazzaar/presentation/widgets/button1.dart';
import 'package:flutter/material.dart';

class HorizontalFilterPart extends StatelessWidget {
  final List<String>? items;
  final Map<String, dynamic>? items1;
  final String mainCategory;
  final String autotype;
  const HorizontalFilterPart({
    super.key,
    required this.items,
    required this.mainCategory,
    this.items1,
    required this.autotype,
  });

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
                  MaterialPageRoute(builder: (context) => MainFilterService()),
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
                  FilterButton1(
                    title: mainCategory,
                    filter: true,
                    items: items1,
                    options: items1,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Car Origin',
                    filter: true,
                    items: items!,
                    options: originOptions,
                    multiseslect: true,
                  ),
                  FilterButton(
                    title: 'Brand List',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: BrandScreen(autotype: autotype, ispost: true),
                  ),
                  FilterButton(
                    title: 'Body Type',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: BodyTypeScreen(name: "Shop & Services"),
                  ),
                  FilterButton(
                    title: 'Year',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: YearScreen(ispost: true),
                  ),
                  FilterButton(
                    title: 'Condition',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: PaymentMethod(ispost: true),
                  ),
                  FilterButton(
                    title: 'Regional Specs',
                    filter: true,
                    options: regionalSpecifications,
                    multiseslect: true,
                    items: items!,
                  ),
                  FilterButton(
                    title: 'Listing Type',
                    filter: true,
                    items: items!,
                    multiseslect: true,
                    options: listingOptions,
                  ),
                  FilterButton(
                    title: 'Location',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: StateArea(ispost: true),
                  ),
                  FilterButton(
                    title: 'Working Hours',
                    filter: true,
                    items: items!,
                    options: [],
                    multiseslect: false,
                    navigate: BusinessInfoScreen(ispost: true),
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
