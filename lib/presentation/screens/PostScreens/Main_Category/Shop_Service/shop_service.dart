import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/brand_dropdown.dart';
import 'package:autobazzaar/components/category_dropdown.dart';
import 'package:autobazzaar/components/drop_down1.dart';
// import 'package:autobazzaar/components/dropdown2.dart';
import 'package:autobazzaar/components/multiple_select_dropdown.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/brand_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../data/dummy_data.dart';
// import '../widgets/dropdown_component.dart';

class ShopService extends StatefulWidget {
  final String title;
  // final String name;
  const ShopService({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _ShopServiceState createState() => _ShopServiceState();
}

class _ShopServiceState extends State<ShopService> {
  int? autoPart;
  BrandItem? selectedBrand;
  int? autoCategoryType;
  int? autoSubCategoryType;
  int? selectedBodyCondition;
  int? autoCondition;
  int? selectedYear;
  int? origin;
  int? selectedPayment;
  bool isSignupSelected = true;
  LatLng? selectedLocation;
  late GoogleMapController mapController;
  String? selectedMainCategory;
  List<String> selectedSubCategories = [];
  List<String> working = [];
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // void _onTap(LatLng position) {
  //   setState(() {
  //     selectedLocation = position;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: redlight,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search any auto type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                DottedBorder(
                  dashPattern: [8, 4],
                  strokeWidth: 1,
                  strokeCap: StrokeCap.round,
                  padding: EdgeInsets.all(40),
                  // borderType: BorderType.Oval,
                  // radius: Radius.circular(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brand",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 5),
                      SizedBox(height: 15),
                      BrandDropdown(
                        brands: brands,
                        onSelected: (brand) {
                          setState(() {
                            selectedBrand = brand;
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      CategoryDropdown(
                        onMainCategoryChanged: (value) {
                          setState(() {
                            selectedMainCategory = value;
                            selectedSubCategories = []; // Reset selection
                          });
                        },
                        onSubCategoryChanged: (value) {
                          setState(() {
                            selectedSubCategories = value;
                          });
                        },
                        mainCategories: mainCategories,
                        subCategories: subCategories,
                        title: 'Service Type',
                        titlesub: 'Seervice Sub-Type',
                      ),
                      SizedBox(height: 15),
                      MultiSelectDropdown(
                        title: "Working Hours",
                        // items: autoConditionType,
                        // selectedIndex: autoCondition,
                        onSelectionChanged: (index) {
                          setState(() {
                            working = index;
                          });
                        }, options: workingHours,
                      ),
                      // SizedBox(height: 15),
                      // DropDownComponent1(
                      //   title1: "Year",
                      //   items1: years,
                      //   selectedIndex1: selectedYear,
                      //   onChanged1: (index) {
                      //     setState(() {
                      //       selectedYear = index;
                      //     });
                      //   },
                      // ),
                      SizedBox(height: 15),
                      DropDownComponent(
                        title: "Origin",
                        items: autoOrigin,
                        selectedIndex: origin,
                        onChanged: (index) {
                          setState(() {
                            origin = index;
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      _buildTextField("Price", "Price...."),
                      SizedBox(height: 15),
                      DropDownComponent(
                        title: "Payment Method",
                        items: autoPayment,
                        selectedIndex: selectedPayment,
                        onChanged: (index) {
                          setState(() {
                            selectedPayment = index;
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      // _buildTextField("Payment Method"),
                      _buildTextField("Contact Details", "Contact Details...."),
                      SizedBox(height: 15),
                      _buildTextField("Area", "Area...."), SizedBox(height: 15),
                      _buildTextField("Governorate", "Governorate...."),
                      SizedBox(height: 15),

                      SizedBox(height: 30),
                      // Map Placeholder
                      // SizedBox(
                      //   height: 300,
                      //   child: GoogleMap(
                      //           onMapCreated: _onMapCreated,
                      //           initialCameraPosition: CameraPosition(
                      //             target: LatLng(31.5204, 74.3587), // Default location (Lahore)
                      //             zoom: 14,
                      //           ),
                      //           markers: selectedLocation != null
                      //               ? {
                      //   Marker(
                      //     markerId: MarkerId("selected"),
                      //     position: selectedLocation!,
                      //   ),
                      //                 }
                      //               : {},
                      //           onTap: _onTap,
                      //         ),
                      // ),

                      // Buttons
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Signup Button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupSelected = true;
                                });
                                //   Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => RegisterForm(),
                                //   ),
                                // );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: isSignupSelected ? blacklight : red,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Draft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            /// Guest Button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupSelected = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSignupSelected
                                          ? redlight
                                          : Colors.black54,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            focusColor: const Color.fromARGB(255, 248, 1, 1),
            fillColor: black,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
