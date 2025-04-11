import 'package:autobazzaar/components/ads_header.dart';
import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/car_ad.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/autosalesmain.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:flutter/material.dart';

class AutoSales extends StatelessWidget {
  final String title;
  final List<Car> carList;
  const AutoSales({super.key, required this.title, required this.carList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AutoSalesMain(),
                    ),
                  );
                },
                child: const Text("View All →"),
              ),
            ],
          ),
        ),
        // VehiclesHeader(
        //   onSortPressed: () {
        //     print("Sort Clicked!");
        //   },
        //   onFilterPressed: () {
        //     print("Filter Clicked!");
        //   },
        //   title: title,
        // ),
        DataCarousel(carList: carList, show: false,),
      ],
    );
  }
}
