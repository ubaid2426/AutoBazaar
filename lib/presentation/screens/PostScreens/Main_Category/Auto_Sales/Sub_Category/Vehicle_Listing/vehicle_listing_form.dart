// import 'package:autobazzaar/components/dropdown_color.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/components/brand_dropdown.dart';
// import 'package:autobazzaar/components/drop_down1.dart';
// import 'package:autobazzaar/components/dropdown2.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/index.dart';
// import 'package:autobazzaar/models/brand_item.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import '../data/dummy_data.dart';
// // import '../widgets/dropdown_component.dart';
// import 'package:country_state_city/country_state_city.dart' as csc;

// class VehicleAuotsForm extends StatefulWidget {
//   final String title;
//   // final String name;
//   const VehicleAuotsForm({super.key, required this.title});

//   @override
//   // ignore: library_private_types_in_public_api
//   _VehicleAuotsFormState createState() => _VehicleAuotsFormState();
// }

// class _VehicleAuotsFormState extends State<VehicleAuotsForm> {
//   int? selectedCategory;
//   int? selectedAutoType;
//   int? selectedBodyCondition;
//   int? selectedEngineSize;
//   int? selectedYear;
//   int? selected;
//   int? selectedTransmission;
//   int? selectedFuel;
//   int? selectedPayment;
//   bool isSignupSelected = true;
//   int? selectedFeatures;
//   BrandItem? selectedBrand;
//   LatLng? selectedLocation;
//   late GoogleMapController mapController;

//   List<csc.Country> filteredCountries = [];
//   List<csc.State> states = [];
//   List<csc.City> cities = [];

//   csc.Country? selectedCountry;
//   csc.State? selectedState;
//   csc.City? selectedCity;

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadCountryData();
//   }

//   Future<void> _loadCountryData() async {
//     const targetCodes = ['PK', 'KW', 'SA'];
//     final allCountries = await csc.getAllCountries();
//     final filtered =
//         allCountries.where((c) => targetCodes.contains(c.isoCode)).toList();

//     setState(() {
//       filteredCountries = filtered;
//       isLoading = false;
//     });
//   }

//   Future<void> _onCountrySelected(csc.Country country) async {
//     setState(() {
//       selectedCountry = country;
//       selectedState = null;
//       selectedCity = null;
//       states = [];
//       cities = [];
//       isLoading = true;
//     });

//     final loadedStates = await csc.getStatesOfCountry(country.isoCode);
//     final loadedCities = await csc.getCountryCities(country.isoCode);

//     setState(() {
//       states = loadedStates;
//       cities = loadedCities;
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: redlight,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 // TextField(
//                 //   decoration: InputDecoration(
//                 //     prefixIcon: Icon(Icons.search),
//                 //     hintText: "Search any auto type",
//                 //     border: OutlineInputBorder(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(height: 30),
//                 DottedBorder(
//                   dashPattern: [8, 4],
//                   strokeWidth: 1,
//                   strokeCap: StrokeCap.round,
//                   padding: EdgeInsets.all(40),
//                   // borderType: BorderType.Oval,
//                   // radius: Radius.circular(40),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // DropDownComponent(
//                       //   title: "Auto Type",
//                       //   items: autoTypes,
//                       //   selectedIndex: selectedAutoType,
//                       //   onChanged: (index) {
//                       //     setState(() {
//                       //       selectedAutoType = index;
//                       //     });
//                       //   },
//                       // ),
//                       SizedBox(height: 15),
//                       Text(
//                         "Brand",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 5),
//                       BrandDropdown(
//                         brands: brands,
//                         onSelected: (brand) {
//                           setState(() {
//                             selectedBrand = brand;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                        _buildTextField("Model", "Model"),
//                       SizedBox(height: 15),
//                       //  Text("Year", style: TextStyle(fontWeight: FontWeight.bold)),
//                       // SizedBox(height: 5),
//                       DropDownComponent1(
//                         title1: "Year",
//                         items1: years,
//                         selectedIndex1: selectedYear,
//                         onChanged1: (index) {
//                           setState(() {
//                             selectedYear = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       // More Fields
//                       // _buildTextField("Brand Name"),
//                       // _buildTextField("Year"),
//                       // _buildTextField("Exterior Colour", "Exterior Colour"),
//                      ColorDropdown(title: 'Exterior Colour',),
//                       SizedBox(height: 15),
//                      ColorDropdown(title: 'Interior Colour',),
//                       SizedBox(height: 15),
//                       // _buildTextField("Interior Colour", "Interior Colour"),
//                       // SizedBox(height: 5),
//                       DropDownComponent(
//                         title: "Body Condition",
//                         items: autoCondition,
//                         selectedIndex: selectedBodyCondition,
//                         onChanged: (index) {
//                           setState(() {
//                             selectedBodyCondition = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       // SizedBox(height: 5),
//                       DropDownComponent(
//                         title: "Enngine Size",
//                         items: autoEngine,
//                         selectedIndex: selectedEngineSize,
//                         onChanged: (index) {
//                           setState(() {
//                             selectedEngineSize = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       // SizedBox(height: 5),
//                       // _buildTextField("Body Condition"),
//                       // _buildTextField("Engine Size"),
//                       _buildTextField("Mileage", "Mileage"),
//                       SizedBox(height: 15),
//                       DropDownComponent(
//                         title: "Transmission Type",
//                         items: autoTramission,
//                         selectedIndex: selectedTransmission,
//                         onChanged: (index) {
//                           setState(() {
//                             selectedTransmission = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       // _buildTextField("Transmission Type"),
//                       // _buildTextField("Fuel Type"),
//                       DropDownComponent(
//                         title: "Fuel Type",
//                         items: autoFuel,
//                         selectedIndex: selectedFuel,
//                         onChanged: (index) {
//                           setState(() {
//                             selectedFuel = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       _buildTextField("Features", "Features"),
//                       SizedBox(height: 15),
//                       _buildTextField("Price", "Price"), SizedBox(height: 15),
//                       DropDownComponent(
//                         title: "Payment Method",
//                         items: autoPayment,
//                         selectedIndex: selectedPayment,
//                         onChanged: (index) {
//                           setState(() {
//                             selectedPayment = index;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       // _buildTextField("Payment Method"),
//                       _buildTextField("Contact Details", "Contact Details"),
//                       SizedBox(height: 15),

//                       //   DropDownComponent(
//                       //   title: "Select Country",
//                       //   items:  filteredCountries.map((country) {
//                       //               return DropdownMenuItem(
//                       //                 value: country,
//                       //                 child: Text(country.name),
//                       //               );
//                       //             }).toList(),
//                       //   selectedIndex: selectedPayment,
//                       //   onChanged: (index) {
//                       //     setState(() {
//                       //       selectedPayment = index;
//                       //     });
//                       //   },
//                       // ),
//                       Text(
//                         "Select Country",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       DropdownButtonFormField<csc.Country>(
//                         isExpanded: true,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 14,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           hintText:
//                               'Select Country', // Or 'Select Country' based on your case
//                         ),
//                         value: selectedCountry,
//                         items:
//                             filteredCountries.map((country) {
//                               return DropdownMenuItem(
//                                 value: country,
//                                 child: Text(country.name),
//                               );
//                             }).toList(),
//                         onChanged: (country) {
//                           if (country != null) {
//                             _onCountrySelected(country);
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                         Text(
//                         "Select State",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       if (states.isNotEmpty)
//                         DropdownButtonFormField<csc.State>(
//                           isExpanded: true,
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 14,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Colors.grey),
//                             ),
//                             hintText:
//                                 'Select State', // Or 'Select Country' based on your case
//                           ),
//                           value: selectedState,
//                           items:
//                               states.map((state) {
//                                 return DropdownMenuItem(
//                                   value: state,
//                                   child: Text(state.name),
//                                 );
//                               }).toList(),
//                           onChanged: (state) {
//                             setState(() {
//                               selectedState = state;
//                             });
//                           },
//                         ),
//                       const SizedBox(height: 16),
//                         Text(
//                         "Select City",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       if (cities.isNotEmpty)
//                         // DropdownButton<csc.City>(
//                         //   isExpanded: true,
//                         //   hint: const Text('Select City'),
//                         //   value: selectedCity,
//                         //   items:
//                         //       cities.map((city) {
//                         //         return DropdownMenuItem(
//                         //           value: city,
//                         //           child: Text(city.name),
//                         //         );
//                         //       }).toList(),
//                         //   onChanged: (city) {
//                         //     setState(() {
//                         //       selectedCity = city;
//                         //     });
//                         //   },
//                         // ),
//                         DropdownButtonFormField<csc.City>(
//                           isExpanded: true,
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 14,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Colors.grey),
//                             ),
//                             hintText:
//                                 'Select City', // Or 'Select Country' based on your case
//                           ),
//                           value: selectedCity,
//                           items:
//                               cities.map((city) {
//                                 return DropdownMenuItem(
//                                   value: city,
//                                   child: Text(city.name),
//                                 );
//                               }).toList(),
//                           onChanged: (city) {
//                             setState(() {
//                               selectedCity = city;
//                             });
//                           },
//                         ),
//                       SizedBox(height: 15),

//                       // Buttons
//                       Center(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             /// Signup Button
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isSignupSelected = true;
//                                 });
//                                 //   Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => RegisterForm(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 12,
//                                   horizontal: 30,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: isSignupSelected ? blacklight : red,
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(30),
//                                     bottomLeft: Radius.circular(30),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   "Draft",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),

//                             /// Guest Button
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isSignupSelected = false;
//                                 });
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 12,
//                                   horizontal: 30,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color:
//                                       isSignupSelected
//                                           ? redlight
//                                           : Colors.black54,
//                                   borderRadius: const BorderRadius.only(
//                                     topRight: Radius.circular(30),
//                                     bottomRight: Radius.circular(30),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   "Submit",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String placeholder) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 5),
//         TextField(
//           decoration: InputDecoration(
//             hintText: placeholder,
//             focusColor: const Color.fromARGB(255, 248, 1, 1),
//             fillColor: black,
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//         ),
//         SizedBox(height: 15),
//       ],
//     );
//   }
// }
