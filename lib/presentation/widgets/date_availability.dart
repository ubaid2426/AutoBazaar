import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendarScreen extends StatelessWidget {
  final List<DateTime> reservedDates;

  const BookingCalendarScreen({super.key, required this.reservedDates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Booking", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),backgroundColor: red,),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                 
                  SizedBox(height: 4),
                  Text("Check availability", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              availableGestures: AvailableGestures.all,
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(), // remove today's highlight
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final isReserved = reservedDates.any((d) =>
                      d.year == day.year && d.month == day.month && d.day == day.day);

                  return Center(
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: isReserved ? Colors.red : Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
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
