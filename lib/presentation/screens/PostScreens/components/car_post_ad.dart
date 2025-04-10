// import 'package:autobazzaar/components/buildTextField.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/3wheeler.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:autobazzaar/components/buildTextField.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/postingimages.dart';
import 'package:autobazzaar/core/constants/validators.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Auto_Parts/auto_parts_form.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Vehicle_Listing/vehicle_listing_form.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Wanted/auto_wanted.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/shop_service.dart';
// import 'package:autobazzaar/screens/PostScreens/listing_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CarPostAdScreen extends StatefulWidget {
  final String title;
  final String name;
  final String namesub;
  final String type;
  const CarPostAdScreen({
    super.key,
    required this.title,
    required this.name,
    required this.namesub,
    required this.type,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarPostAdScreenState createState() => _CarPostAdScreenState();
}

class _CarPostAdScreenState extends State<CarPostAdScreen> {
  // final TextEditingController _descriptionController = TextEditingController();
  late final FocusNode _titleNode;
  late final FocusNode _descriptionNode;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  String? selectedTitle;
  List<File> selectedImages = [];
  void navigateToVehicleScreen(
    BuildContext context,
    String title,
    String name,
    String namesub,
    String type,
  ) {
    Widget? screen;

    if (namesub == "Vehicle") {
      print(namesub);
      // screen = BrandScreen(type: type,);
      if (type == "Car" ||
          type == "Taxi" ||
          type == "Motor bike" ||
          type == "Water Crafts") {
        screen = BrandScreen(type: type);
      } else if (type == "Quad/Buggy" || type == "3-Wheeler") {
        screen = ThreeWheelerScreen(type: type);
      } else if (type == "Van" ||
          type == "Lorry" ||
          type == "Bus" ||
          type == "RV/Camper van") {}
      // screen = VehicleAuotsForm(
      //   title: 'Vehicle Form',
      // ); // Replace with the actual screen
    } else if (name == "Shop &\n Services") {
      screen = ShopService(
        title: 'Shop & Service',
      ); // Replace with actual screen
    } else if (namesub == "Auto\n Parts") {
      screen = AutoPartsForm(
        title: 'Auto Part Form',
      ); // Replace with actual screen
    } else if (name == "Auto \n Wanted") {
      screen = AutoWanted(); // Replace with actual screen
    } else {
      // screen = VehicleAuotsForm(title: title); // Default screen
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
  }

  final List<String> titleOptions = ["SUV", "Sedan", "Hatchback", "Truck"];

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImages.add(File(pickedFile.path));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleNode = FocusNode();
    _descriptionController = TextEditingController();
    _descriptionNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleNode.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white, // Light background for premium feel
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: redlight,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **Dropdown - Title Selection**
              _buildSectionTitle("Title"),
              // buildTextField(label: '', hint: '', controller: null, focusNode: null, keyboardType: null, validator: (String? ) {  }),
              buildTextField(
                label: 'Title',
                hint: 'Enter Title here...',
                controller: _titleController,
                focusNode: _titleNode,
                keyboardType: TextInputType.name,
                maxline: 1,
                validator: (value) => checkNullEmptyValidation(value, 'title'),
              ),
              const SizedBox(height: 20),

              // **Description Input Field**
              _buildSectionTitle("Description"),
              // _buildDescriptionField(),
              buildTextField(
                label: 'Description',
                hint: 'Enter Description here...',
                controller: _descriptionController,
                focusNode: _descriptionNode,
                keyboardType: TextInputType.name,
                maxline: 3,
                validator:
                    (value) => checkNullEmptyValidation(value, 'Description'),
              ),
              const SizedBox(height: 20),

              // **Image Picker Section**
              _buildSectionTitle("Upload Images (Max 10)"),
              SizedBox(
                height:
                    320, // You can adjust this height based on your design needs
                child: PostingImages(),
              ),

              const SizedBox(height: 30),

              // **Next Button**
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: redlight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                  ),
                  onPressed: () {
                    navigateToVehicleScreen(
                      context,
                      widget.title,
                      widget.name,
                      widget.namesub,
                      widget.type,
                    );
                  },
                  child: const Text(
                    "Next",
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
      ),
    );
  }

  // **Reusable Widgets for Clean Code**

  // **Section Title**
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  // **Image Picker Grid**
  // Widget _buildImagePicker() {
  //   return Container(
  //     padding: const EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.2),
  //           blurRadius: 6,
  //           spreadRadius: 2,
  //         ),
  //       ],
  //     ),
  //     child: Wrap(
  //       spacing: 10,
  //       runSpacing: 10,
  //       children: [
  //         ...selectedImages.map(
  //           (image) => ClipRRect(
  //             borderRadius: BorderRadius.circular(8),
  //             child: Image.file(
  //               image,
  //               width: 80,
  //               height: 80,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         if (selectedImages.length < 10)
  //           GestureDetector(
  //             onTap: _pickImage,
  //             child: Container(
  //               width: 80,
  //               height: 80,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[200],
  //                 borderRadius: BorderRadius.circular(8),
  //                 border: Border.all(color: Colors.grey.shade400),
  //               ),
  //               child: const Icon(
  //                 Icons.add_photo_alternate,
  //                 color: Colors.grey,
  //                 size: 30,
  //               ),
  //             ),
  //           ),
  //       ],
  //     ),
  //   );
  // }
}
