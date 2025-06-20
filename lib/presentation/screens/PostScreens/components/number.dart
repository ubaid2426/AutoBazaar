import 'dart:io';

import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/choose_ad_post.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/state_area.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/bodytype.dart';
import 'package:flutter/material.dart';

class PhoneNumberInputScreen extends StatefulWidget {
    final String name;
  final String? namesub;
  final String? brand;
  final List<String>? models;
  final List<File>? images; // <-- new param
  final String? title;
  final String? description;
  final String? transmission;
  final String? year;
  final String? region;
  final String? fueltype;
  final String? enginesize;
  final String? excolor;
  final String? incolor;
  final List<String>? inoption;
  final List<String>? technology;
  final String? bodytype;
  final String? seats;
  final String? repainted;
  final String? bodycondition;
  final String? insurance;
  final String? carcondition;
  final String? paymentmethod;
  //services screen
  final String? autotype;
  final String? mainheading;
  // final String name;
  // final String? namesub;
  final List<String>? subheading;
  final Map<String, Set<String>>? services;
  const PhoneNumberInputScreen({
    super.key,
    this.autotype,
    this.mainheading,
    this.subheading,
    this.services,
   required this.name,
    this.namesub, this.brand, this.models, this.images, this.title, this.description, this.transmission, this.year, this.region, this.fueltype, this.enginesize, this.excolor, this.incolor, this.inoption, this.technology, this.bodytype, this.seats, this.repainted, this.bodycondition, this.insurance, this.carcondition, this.paymentmethod,
  });

  @override
  State<PhoneNumberInputScreen> createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  List<TextEditingController> numberControllers = [TextEditingController()];
  List<bool> whatsappAvailable = [false];

  bool homeServiceAvailable = false;

  void addPhoneNumberField() {
    setState(() {
      numberControllers.add(TextEditingController());
      whatsappAvailable.add(false);
    });
  }

  void removePhoneNumberField(int index) {
    setState(() {
      numberControllers.removeAt(index);
      whatsappAvailable.removeAt(index);
    });
  }

  void handleSubmit() {
    final numbers =
        numberControllers.map((controller) => controller.text).toList();

    for (int i = 0; i < numbers.length; i++) {
      debugPrint(
        'Number ${i + 1}: ${numbers[i]}, WhatsApp: ${whatsappAvailable[i]}',
      );
    }

    debugPrint('Home Service Available: $homeServiceAvailable');
    // You can proceed to save this or navigate
    if (widget.name == "Auto \n Sales ") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseAdPostTypeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => StateArea(
                autotype: widget.autotype,
                mainheading: widget.mainheading,
                subheading: widget.subheading,
                services: widget.services,
                name: widget.name,
                namesub: widget.namesub,
                contactnumber: numbers,
              ),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in numberControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return Scaffold(
      appBar: AppBar(title: const Text("Phone Numbers"), backgroundColor: red),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: numberControllers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Number ${index + 1}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: numberControllers[index],
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter phone number",
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: whatsappAvailable[index],
                                onChanged: (value) {
                                  setState(() {
                                    whatsappAvailable[index] = value ?? false;
                                  });
                                },
                              ),
                              const Text("Available on WhatsApp"),
                              const Spacer(),
                              if (index != 0)
                                IconButton(
                                  icon: const Icon(Icons.delete, color: red),
                                  onPressed:
                                      () => removePhoneNumberField(index),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: homeServiceAvailable,
                  onChanged: (value) {
                    setState(() {
                      homeServiceAvailable = value ?? false;
                    });
                  },
                ),
                const Text("Home service available?"),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: addPhoneNumberField,
              icon: const Icon(Icons.add),
              label: const Text("Add Another Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: Colors.black54,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // }
  }
}
