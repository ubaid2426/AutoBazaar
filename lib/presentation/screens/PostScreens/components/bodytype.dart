import 'dart:io';
import 'dart:math';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/seats.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/years.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/shop_service.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/seats.dart';
import 'package:flutter/material.dart';

class BodyTypeScreen extends StatefulWidget {
  final String? name;
  final String? namesub;
  final String? brand;
  final String? maincategory;
  final String? subcategory;
  final String? autotype;
  final List<String>? services;
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
  const BodyTypeScreen({
    super.key,
    this.namesub,
    this.brand,
    this.models,
    this.images,
    this.title,
    this.description,
    this.transmission,
    this.year,
    this.region,
    this.fueltype,
    this.enginesize,
    this.excolor,
    this.incolor,
    this.inoption,
    this.technology,
    this.name,
    this.maincategory,
    this.subcategory,
    this.autotype,
    this.services,
  });

  @override
  State<BodyTypeScreen> createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  @override
  Widget build(BuildContext context) {
    // print("namesub: ${widget.namesub}");
    // print("name: ${widget.name}");
    // print("images: ${widget.images}");
    // print("title: ${widget.title}");
    // print("description: ${widget.description}");
    // print("maincategory: ${widget.maincategory}");
    // print("subcategory: ${widget.subcategory}");
    // print("services: ${widget.services}");
    // print("autotype: ${widget.autotype}");

    return Scaffold(
      appBar: AppBar(title: Text("What is the Body type?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose the body type of the car"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for Body Type",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bodyTypes.length,
                itemBuilder: (context, index) {
                  final item = bodyTypes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item["image"],
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        item["title"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        if (widget.namesub == "Auto\n Parts") {
                          print("Year Screen");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => YearScreen(
                                    namesub: widget.namesub ?? "",
                                    name: widget.name,
                                    images: widget.images ?? [],
                                    title: widget.title ?? "null",
                                    description: widget.description ?? "null",
                                    maincategory: widget.maincategory ?? "null",
                                    subcategory: widget.subcategory ?? "null",
                                    services: widget.services ?? [],
                                    autotype: widget.autotype ?? "null",
                                    bodytype: item["title"],
                                  ),
                            ),
                          );
                        } else {
                          print("Seat Screen");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => SeatsScreen(
                                    namesub: widget.namesub!,
                                    brand: widget.brand!,
                                    models: widget.models!,
                                    images: widget.images!,
                                    title: widget.title!,
                                    description: widget.description!,
                                    transmission: widget.transmission??"",
                                    year: widget.year!,
                                    region: widget.region??"",
                                    fueltype: widget.fueltype??"",
                                    enginesize: widget.enginesize??"",
                                    excolor: widget.excolor??"",
                                    incolor: widget.incolor??"",
                                    inoption: widget.inoption??[],
                                    technology: widget.technology??[],
                                    bodytype: item["title"],
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
