import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Accident_Autos/accident_auto_form.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Auto_Parts/autopartmain.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Sales/Sub_Category/Scraps_Autos/scraps_auto_form.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/3wheeler.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:autobazzaar/components/buildTextField.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/postingimages.dart';
import 'package:autobazzaar/core/constants/validators.dart';
import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/shop_service.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/region.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/years.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CarPostAdScreen extends StatefulWidget {
  // final String title;
  final String? name;
  final String? namesub;
  final String? autotype;
  // for auto services
  final String? mainheading;
  final List<String>? subheading;
  final Map<String, Set<String>>? services;
  final List<String>? contactnumber;
  final String? country;
  final String? state;
  final String? city;
  final String? region;

  const CarPostAdScreen({
    super.key,
    // required this.title,
    this.name,
    this.namesub,
    this.autotype,
    this.mainheading,
    this.subheading,
    this.services,
    this.contactnumber,
    this.country,
    this.state,
    this.city,
    this.region,
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
    // String title,
    String name,
    String namesub,
    String autotype,
    String title,
    String description,
    List<File> images, // <-- new param
  ) {
    Widget? screen;

    if (namesub == "Vehicle") {
      print(namesub);
      // screen = BrandScreen(type: type,);
      if (autotype == "Car" ||
          autotype == "Taxi" ||
          autotype == "Motor bike" ||
          autotype == "Water Crafts") {
        screen = BrandScreen(
          autotype: autotype,
          filteruse: false,
          namesub: namesub,
          images: images,
          title: '',
          description: '',
        );
      } else if (autotype == "Quad/Buggy" || autotype == "3-Wheeler") {
        screen = ThreeWheelerScreen(type: autotype);
      } else if (autotype == "Van" ||
          autotype == "Lorry" ||
          autotype == "Bus" ||
          autotype == "RV/Camper van") {
        screen = YearScreen(
          namesub: namesub,
          // brand: brand,
          // models: models,
          images: images,
          title: title,
          description: description,
        );
      }
    } else if (name == "Shop &\n Services") {
      screen = RegionScreen(autotype: autotype); // Replace with actual screen
    } else if (namesub == "Auto\n Parts") {
      screen = AutopartForm(
        autotype: autotype, name: name, namesub: namesub,
      ); // Replace with actual screen
    } else if (namesub == "Accidental & Autos") {
      screen = AccidentAutoForm(); // Replace with actual screen
    } else if (namesub == "Scraps & Autos") {
      screen = ScrapsAutosForm(); // Replace with actual screen
    } else {}
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
  }

  final List<String> titleOptions = ["SUV", "Sedan", "Hatchback", "Truck"];

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
          widget.autotype!,
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
                child: PostingImages(
                  onImagesSelected: (List<File> images) {
                    setState(() {
                      selectedImages = images;
                    });
                  },
                ),
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
                      // widget.title,
                      widget.name!,
                      widget.namesub!,
                      widget.autotype!,
                      _descriptionController.text,
                      _titleController.text,
                      selectedImages,
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
}
