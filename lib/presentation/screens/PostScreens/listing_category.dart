import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/listing_component.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Auto_Parts/auto_parts_form.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Auto_Parts/autopartmain.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Vehicle_Listing/vehicle_main.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Wanted/auto_wanted.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/shop_service.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/listing_sub_category.dart';
import 'package:flutter/material.dart';

class ListingCategory extends StatelessWidget {

  const ListingCategory({super.key});
  void navigateToVehicleScreen(
    BuildContext context,
    // String title,
    String name,
    // String namesub,
  ) {
    Widget? screen;

    if (name == "Auto \n Sales") {
      // print(namesub);
      screen = ListingSubCategory(name: name); // Replace with the actual screen
    } else if (name == "Shop &\n Services") {
      screen = VehicleSelectionScreen(namesub: "", name: name);
    } else if (name == "Auto\n Rental") {
      screen = AutopartForm(
        autotype: 'Car', name: name, namesub: '',
        // title: 'Auto Part Form',
      ); // Replace with actual screen
    } else if (name == "Auto \n Wanted") {
      screen = AutoWanted(); // Replace with actual screen
    } else {
      // screen = ShopService(title: "Shop & Service"); // Default screen
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Category'),
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
                onTap: () => navigateToVehicleScreen(context, "Auto \n Sales"),
                child: ListingMain(
                  name: "Auto \n Sales",
                  image: "assets/images/listing_form/cars.png",
                ),
              ),
              InkWell(
                onTap:
                    () => navigateToVehicleScreen(context, "Shop &\n Services"),
                child: ListingMain(
                  name: "Shop &\n Services",
                  image: "assets/images/listing_form/service.png",
                ),
              ),
              InkWell(
                onTap: () => navigateToVehicleScreen(context, "Auto\n Rental"),
                child: ListingMain(
                  name: "Auto\n Rental",
                  image: "assets/images/listing_form/rental.png",
                ),
              ),
              InkWell(
                onTap: () => navigateToVehicleScreen(context, "Auto \n Wanted"),
                child: ListingMain(
                  name: "Auto \n Wanted",
                  image: "assets/images/listing_form/wanted.png",
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
