import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/listing_component.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Vehicle_Listing/vehicle_main.dart';
// import 'package:autobazzaar/screens/PostScreens/listing_main.dart';
import 'package:flutter/material.dart';

class ListingSubCategory extends StatelessWidget {
  final String name;
  const ListingSubCategory({super.key, required this.name});
  void navigateToVehicleScreen(BuildContext context, String namesub) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleSelectionScreen(namesub: namesub, name: name,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Category'),
        centerTitle: true,
        backgroundColor: red,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              // colors: [redlight, redlight],
              colors: [white, white],
            ),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () => navigateToVehicleScreen(context, "Vehicle"),
                child: ListingMain(
                  name: "Vehicles",
                  image: "assets/images/listing_form/cars.png",
                ),
              ),
              InkWell(
                onTap:
                    () => navigateToVehicleScreen(context, "Scraps & Autos"),
                child: ListingMain(
                  name: "Scraps \n Auto",
                  image: "assets/images/listing_form/scrap.png",
                ),
              ),
              InkWell(
                onTap: () => navigateToVehicleScreen(context, "Auto\n Parts"),
                child: ListingMain(
                  name: "Auto\n Parts",
                  image: "assets/images/listing_form/part.png",
                ),
              ),
              InkWell(
                onTap: () => navigateToVehicleScreen(context, "Accidental & Autos"),
                child: ListingMain(
                  name: "Accidental \n Autos",
                  image: "assets/images/listing_form/accident.png",
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}
