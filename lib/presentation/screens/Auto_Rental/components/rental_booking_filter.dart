import 'package:flutter/material.dart';

class RentalBookingScreen extends StatefulWidget {
  const RentalBookingScreen({super.key});

  @override
  State<RentalBookingScreen> createState() => _RentalBookingScreenState();
}

class _RentalBookingScreenState extends State<RentalBookingScreen> {
  String locationType = "Within City";
  String driverOption = "With Driver";
  String rentalPeriod = "Daily";

  DateTime? departureDate;
  DateTime? returnDate;
  TimeOfDay? departureTime = const TimeOfDay(hour: 13, minute: 15);
  TimeOfDay? returnTime = const TimeOfDay(hour: 19, minute: 0);

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isDeparture) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isDeparture
          ? (departureTime ?? TimeOfDay.now())
          : (returnTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureTime = picked;
        } else {
          returnTime = picked;
        }
      });
    }
  }

  Widget _buildToggle(String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? Colors.blue.shade50 : Colors.white,
            border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.blue : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeRow(String label, TimeOfDay? time, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.directions_car, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                '${time?.format(context) ?? "--:--"}',
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.access_time, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildToggle("Within City", locationType == "Within City", () {
                  setState(() {
                    locationType = "Within City";
                  });
                }),
                const SizedBox(width: 10),
                _buildToggle("City-to-City", locationType == "City-to-City", () {
                  setState(() {
                    locationType = "City-to-City";
                  });
                }),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("F-10, Islamabad"),
                      Spacer(),
                      Icon(Icons.sync_alt, color: Colors.blue),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: const [
                      Icon(Icons.directions_car, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Bahria Town, Phase IV"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              departureDate != null
                                  ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                                  : "Departure date\ndd/mm/yy",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              returnDate != null
                                  ? "${returnDate!.day}/${returnDate!.month}/${returnDate!.year}"
                                  : "Return date\ndd/mm/yy",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Time",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildTimeRow("Departure Time", departureTime,
                    () => _selectTime(context, true)),
                const SizedBox(width: 8),
                _buildTimeRow("Return Time", returnTime,
                    () => _selectTime(context, false)),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Driver Service",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildToggle("With Driver", driverOption == "With Driver", () {
                  setState(() {
                    driverOption = "With Driver";
                  });
                }),
                const SizedBox(width: 10),
                _buildToggle("Self Pick-Up", driverOption == "Self Pick-Up", () {
                  setState(() {
                    driverOption = "Self Pick-Up";
                  });
                }),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Rental Period",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildToggle("Daily", rentalPeriod == "Daily", () {
                  setState(() {
                    rentalPeriod = "Daily";
                  });
                }),
                const SizedBox(width: 10),
                _buildToggle("Weekly", rentalPeriod == "Weekly", () {
                  setState(() {
                    rentalPeriod = "Weekly";
                  });
                }),
                const SizedBox(width: 10),
                _buildToggle("Monthly", rentalPeriod == "Monthly", () {
                  setState(() {
                    rentalPeriod = "Monthly";
                  });
                }),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle show results
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  "Show Results",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
