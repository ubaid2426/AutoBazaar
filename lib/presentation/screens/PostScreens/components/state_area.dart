import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/choose_ad_post.dart';
// import 'package:autobazzaar/presentation/screens/Profile/buy_credits.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';

class StateArea extends StatefulWidget {
  const StateArea({super.key});

  @override
  _StateAreaState createState() => _StateAreaState();
}
class _StateAreaState extends State<StateArea> {
  TextEditingController country=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController city=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: red,
        title: Text('Country Choose',),
      ),
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
                   border: const OutlineInputBorder(borderSide: BorderSide.none))
              ),
              SizedBox(height: 20),

              Text("${country.text}, ${state.text}, ${city.text}"),
                          ElevatedButton(
              onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseAdPostTypeScreen()));
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
          )
      ),
    );
  }
}