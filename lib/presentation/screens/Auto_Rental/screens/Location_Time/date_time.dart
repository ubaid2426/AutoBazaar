import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  _DateTimeScreenState createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime pickUpDate = DateTime(2024, 10, 27);
  DateTime returnDate = DateTime(2024, 10, 27);
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Spacer(),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text("Location and Time", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        stepCircle("1", "Delivery", true),
                        lineBetweenSteps(),
                        stepCircle("2", "Return", true),
                        lineBetweenSteps(),
                        stepCircle("3", "Date/Time", false),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TableCalendar(
                focusedDay: selectedDate,
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  selectedDate = focusedDay;
                },
              ),
              SizedBox(height: 20),
              Text("Select Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              dateTimePicker("Pick Up Date and Time", pickUpDate),
              SizedBox(height: 10),
              dateTimePicker("Return Date and Time", returnDate),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  ),
                  child: Text("Confirm", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepCircle(String number, String label, bool active) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: active ? red : Colors.grey[300],
          child: Text(number, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget lineBetweenSteps() {
    return Container(
      width: 30,
      height: 2,
      color: red,
      margin: EdgeInsets.symmetric(horizontal: 4),
    );
  }

  Widget dateTimePicker(String label, DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            inputContainer(Icons.calendar_today, formattedDate),
            inputContainer(Icons.access_time, formattedDate),
          ],
        ),
      ],
    );
  }

  Widget inputContainer(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}