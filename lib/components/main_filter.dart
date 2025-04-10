import 'package:autobazzaar/components/brand_dropdown.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CheckBoxModel {
  String label;
  bool isSelected;

  CheckBoxModel({required this.label, this.isSelected = false});
}

class MainFilter extends StatefulWidget {
  const MainFilter({super.key});

  @override
  State<MainFilter> createState() => _MainFilterState();
}

class _MainFilterState extends State<MainFilter> {
  String? selectedOption; // Radio selection
  BrandItem? selectedBrand;
  final Map<String, bool> isExpanded = {
    'Car brand': false,
    'Car type': false,
    'Transmission': false,
    'Fuel': false,
    'Engine Capacity': false,
    'Price': false,
    'Installments': false,
    'Features': false,
  };

  // final List<String> brands = [
  //   'Volvo',
  //   'Land Rover',
  //   'Chevrolet',
  //   'BMW',
  //   'Porsche',
  //   'Maserati',
  // ];

  final List<CheckBoxModel> engineCapacityOptions = [
    CheckBoxModel(label: '<1000 cc'),
    CheckBoxModel(label: '1000 - 2000 cc'),
    CheckBoxModel(label: '2000 - 3000 cc'),
    CheckBoxModel(label: '>3000 cc'),
  ];

  final List<CheckBoxModel> transmissionOptions = [
    CheckBoxModel(label: 'Automatic'),
    CheckBoxModel(label: 'Manual'),
  ];

  final List<CheckBoxModel> fuelOptions = [
    CheckBoxModel(label: 'Gas'),
    CheckBoxModel(label: 'Electric'),
    CheckBoxModel(label: 'Hybrid'),
    CheckBoxModel(label: 'Diesel'),
  ];

  final List<String> carTypes = [
    'MPV',
    'SUV',
    'Sedan',
    'Coupe',
    'Van',
    'Truck',
  ];

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
  // class _CarTypeWithVideosState extends State<CarTypeWithVideos> {
  final List<Map<String, String>> carTypeData = [
    {'title': 'MPV', 'video': 'assets/videos/car_type/mpv.mov'},
    {'title': 'SUV', 'video': 'assets/videos/car_type/suv.mov'},
    {'title': 'Sedan', 'video': 'assets/videos/car_type/sedan.mov'},
    {'title': 'Coupe', 'video': 'assets/videos/car_type/coupe.mov'},
    {'title': 'Van', 'video': 'assets/videos/car_type/van.mov'},
    {'title': 'Truck', 'video': 'assets/videos/car_type/truck.mov'},
  ];
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    // Initialize video controllers with auto-play and looping
    _videoControllers =
        carTypeData
            .map(
              (car) =>
                  VideoPlayerController.asset(car['video']!)
                    ..initialize().then((_) {
                      setState(
                        () {},
                      ); // Refresh UI once the video is initialized
                    })
                    ..setLooping(true) // Enable looping
                    ..play(), // Start playing automatically
            )
            .toList();
  }

  @override
  void dispose() {
    // Dispose of the video controllers to free up resources
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Car Filters'),
        centerTitle: true,
        backgroundColor: red,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildExpandableSection(
            //   title: 'Car brand',
            //   child: 
              BrandDropdown(
                brands: brands,
                onSelected: (brand) {
                  setState(() {
                    selectedBrand = brand;
                  });
                },
              ),
            // ),
            _buildExpandableSection(
              title: 'Car type',
              child: buildCarTypeVideos(context),
            ),
            _buildExpandableSection(
              title: 'Transmission',
              child: _buildCheckboxList(transmissionOptions),
            ),
            _buildExpandableSection(
              title: 'Fuel',
              child: _buildCheckboxList(fuelOptions),
            ),
            _buildExpandableSection(
              title: 'Engine Capacity',
              child: _buildCheckboxList(engineCapacityOptions),
            ),
            _buildExpandableSection(title: 'Price', child: _buildPriceRange()),
            _buildExpandableSection(
              title: 'Installments',
              child: _buildRadioList([
                '< KWD 10,000/month',
                '< KWD 20,000/month',
                '> KWD 30,000/month',
              ]),
            ),
            _buildExpandableSection(
              title: 'Features',
              child: _buildFeaturesTags(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded[title] =
                  !(isExpanded[title] ?? false); // Toggle visibility
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Icon(
                isExpanded[title] == true
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        if (isExpanded[title] == true)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: child,
          ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildHorizontalScroll(List<String> items) {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.grey.shade200,
                  child: Text(
                    items[index][0],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(items[index], style: const TextStyle(fontSize: 12.0)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildCarTypeVideos(BuildContext context) {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Prevent internal scrolling
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Maximum 3 columns in one row
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: carTypeData.length,
      itemBuilder: (context, index) {
        final videoController = _videoControllers[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80.0,
              height: 80.0,
              child:
                  videoController.value.isInitialized
                      ? VideoPlayer(videoController)
                      : const Center(
                        child: CircularProgressIndicator(),
                      ), // Loading indicator for video initialization
            ),
            const SizedBox(height: 8.0),
            Text(
              carTypeData[index]['title']!,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckboxList(List<CheckBoxModel> options) {
    return Wrap(
      spacing: 10.0,
      children:
          options.map((option) {
            return FilterChip(
              label: Text(option.label),
              selected: option.isSelected,
              onSelected: (value) {
                setState(() {
                  option.isSelected = value;
                });
              },
            );
          }).toList(),
    );
  }

  Widget _buildPriceRange() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Minimum price',
              prefixText: 'KWD ',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Maximum price',
              prefixText: 'KWD ',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioList(List<String> options) {
    return Column(
      children:
          options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            );
          }).toList(),
    );
  }

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

// void main() => runApp(const MaterialApp(home: MainFilter()));
