import 'dart:io';

import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/choose_ad_post.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/number.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/region.dart';
// import 'package:autobazzaar/presentation/screens/Profile/buy_credits.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';

class StateArea extends StatefulWidget {
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
  //for Auto services
  final String? autotype;
  final String? mainheading;
  final List<String>? subheading;
  final Map<String, Set<String>>? services;
  final List<String>? contactnumber;
  final String? country;
  final String? state;
  final String? city;

  // final Map<String, Set<String>>? services;
  const StateArea({
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
    this.bodytype,
    this.seats,
    this.repainted,
    this.bodycondition,
    this.insurance,
    this.carcondition,
    this.paymentmethod,
    this.autotype,
    this.mainheading,
    this.subheading,
    this.services,
   required this.name,
    this.contactnumber,
    this.country,
    this.state,
    this.city,
  });

  @override
  _StateAreaState createState() => _StateAreaState();
}

class _StateAreaState extends State<StateArea> {
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return Scaffold(
      appBar: AppBar(backgroundColor: red, title: Text('Country Choose')),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            CountryStateCityPicker(
              country: country,
              state: state,
              city: city,
              dialogColor: Colors.grey.shade200,
              textFieldDecoration: InputDecoration(
                fillColor: Colors.blueGrey.shade100,
                filled: true,
                suffixIcon: const Icon(Icons.arrow_downward_rounded),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 20),

            Text("${country.text}, ${state.text}, ${city.text}"),
            ElevatedButton(
              onPressed: () {
                if (widget.name == "Auto \n Sales") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhoneNumberInputScreen(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegionScreen(name: widget.name,)),
                  );
                }
              },
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
  }
}
