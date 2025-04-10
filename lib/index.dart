import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart' as csc;

class CountryStateCityScreen extends StatefulWidget {
  const CountryStateCityScreen({super.key});

  @override
  State<CountryStateCityScreen> createState() => _CountryStateCityScreenState();
}

class _CountryStateCityScreenState extends State<CountryStateCityScreen> {
  List<csc.Country> filteredCountries = [];
  List<csc.State> states = [];
  List<csc.City> cities = [];

  csc.Country? selectedCountry;
  csc.State? selectedState;
  csc.City? selectedCity;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCountryData();
  }

  Future<void> _loadCountryData() async {
    const targetCodes = ['PK', 'KW', 'SA'];
    final allCountries = await csc.getAllCountries();
    final filtered = allCountries.where((c) => targetCodes.contains(c.isoCode)).toList();

    setState(() {
      filteredCountries = filtered;
      isLoading = false;
    });
  }

  Future<void> _onCountrySelected(csc.Country country) async {
    setState(() {
      selectedCountry = country;
      selectedState = null;
      selectedCity = null;
      states = [];
      cities = [];
      isLoading = true;
    });

    final loadedStates = await csc.getStatesOfCountry(country.isoCode);
    final loadedCities = await csc.getCountryCities(country.isoCode);

    setState(() {
      states = loadedStates;
      cities = loadedCities;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country, State, City Picker')),
      body: isLoading && filteredCountries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<csc.Country>(
                    isExpanded: true,
                    hint: const Text('Select Country'),
                    value: selectedCountry,
                    items: filteredCountries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country.name),
                      );
                    }).toList(),
                    onChanged: (country) {
                      if (country != null) _onCountrySelected(country);
                    },
                  ),
                  const SizedBox(height: 16),
                  if (states.isNotEmpty)
                    DropdownButton<csc.State>(
                      isExpanded: true,
                      hint: const Text('Select State'),
                      value: selectedState,
                      items: states.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state.name),
                        );
                      }).toList(),
                      onChanged: (state) {
                        setState(() {
                          selectedState = state;
                        });
                      },
                    ),
                  const SizedBox(height: 16),
                  if (cities.isNotEmpty)
                    DropdownButton<csc.City>(
                      isExpanded: true,
                      hint: const Text('Select City'),
                      value: selectedCity,
                      items: cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city.name),
                        );
                      }).toList(),
                      onChanged: (city) {
                        setState(() {
                          selectedCity = city;
                        });
                      },
                    ),
                ],
              ),
            ),
    );
  }
}
