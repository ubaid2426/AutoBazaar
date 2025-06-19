import 'package:flutter/material.dart';

class BranchAndWorkingHoursScreen extends StatefulWidget {
  const BranchAndWorkingHoursScreen({super.key});

  @override
  State<BranchAndWorkingHoursScreen> createState() => _BranchAndWorkingHoursScreenState();
}

class _BranchAndWorkingHoursScreenState extends State<BranchAndWorkingHoursScreen> {
  int _branchCount = 1;
  final Map<String, TimeOfDayRange> _workingHours = {};
  final List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    for (var day in _days) {
      _workingHours[day] = TimeOfDayRange(
        start: const TimeOfDay(hour: 9, minute: 0),
        end: const TimeOfDay(hour: 17, minute: 0),
      );
    }
  }

  Future<void> _pickTimeRange(String day) async {
    final start = await showTimePicker(
      context: context,
      initialTime: _workingHours[day]!.start,
    );
    if (start == null) return;

    final end = await showTimePicker(
      context: context,
      initialTime: _workingHours[day]!.end,
    );
    if (end == null) return;

    setState(() {
      _workingHours[day] = TimeOfDayRange(start: start, end: end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("Business Setup"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Branch Info
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "How many branches do you have?",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_branchCount > 1) _branchCount--;
                            });
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          _branchCount.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _branchCount++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Working Hours
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Working Hours",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ..._days.map((day) {
                      final range = _workingHours[day]!;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                day,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _pickTimeRange(day),
                              child: Text("${range.start.format(context)} - ${range.end.format(context)}"),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeOfDayRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeOfDayRange({required this.start, required this.end});
}
