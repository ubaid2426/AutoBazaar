import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/car_post_ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BusinessInfoScreen extends StatefulWidget {
  final String? name;
  final String? namesub;
  final String? region;
  final String? bodytype;
  final List<String>? number;
  final String? country;
  final String? state;
  final String? city;
  final String? autotype;
  final String? mainheading;
  final List<String>? subheading;
  final String? brand;
  final Map<String, Set<String>>? services;
  final bool? ispost;
  const BusinessInfoScreen({
    super.key,
    this.name,
    this.namesub,
    this.region,
    this.bodytype,
    this.number,
    this.autotype,
    this.mainheading,
    this.subheading,
    this.services,
    this.country,
    this.state,
    this.city,
    this.brand,
    this.ispost,
  });

  @override
  State<BusinessInfoScreen> createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends State<BusinessInfoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  int _branchCount = 1;
  final Map<String, bool> _workingDays = {
    'Monday': true,
    'Tuesday': true,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
    'Saturday': false,
    'Sunday': false,
  };
  TimeOfDay _openingTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _closingTime = const TimeOfDay(hour: 17, minute: 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, bool isOpeningTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isOpeningTime ? _openingTime : _closingTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: red,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isOpeningTime) {
          _openingTime = picked;
        } else {
          _closingTime = picked;
        }
      });
    }
  }

  void _toggleDay(String day) {
    setState(() {
      _workingDays[day] = !_workingDays[day]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Scaffold(
              backgroundColor: const Color(0xFFF8F9FA),
              appBar: AppBar(
                backgroundColor: red,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                elevation: 0,
                // backgroundColor: Colors.transparent,
                // leading: IconButton(
                //   icon: const Icon(Icons.arrow_back_ios_new, color: red),
                //   onPressed: () {},
                // ),
                title: const Text(
                  'Working Hours',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Branches Section
                    widget.ispost == true
                        ? const SizedBox.shrink()
                        : AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Branch Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'How many branches does your business have?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF718096),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  _buildCounterButton(Icons.remove, () {
                                    setState(() {
                                      if (_branchCount > 1) _branchCount--;
                                    });
                                  }),
                                  const SizedBox(width: 16),
                                  Text(
                                    '$_branchCount',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: red,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  _buildCounterButton(Icons.add, () {
                                    setState(() {
                                      _branchCount++;
                                    });
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                    const SizedBox(height: 24),
                    // Working Hours Section
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Working Hours',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Set your business working days and hours',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF718096),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Days Selection
                          const Text(
                            'Working Days',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children:
                                _workingDays.keys.map((day) {
                                  return FilterChip(
                                    label: Text(day),
                                    selected: _workingDays[day]!,
                                    onSelected: (bool selected) {
                                      _toggleDay(day);
                                    },
                                    selectedColor: red,
                                    checkmarkColor: Colors.white,
                                    labelStyle: TextStyle(
                                      color:
                                          _workingDays[day]!
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  );
                                }).toList(),
                          ),
                          const SizedBox(height: 24),
                          // Hours Selection
                          const Text(
                            'Working Hours',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTimePicker(
                                  'Opening Time',
                                  '${_openingTime.hour.toString().padLeft(2, '0')}:${_openingTime.minute.toString().padLeft(2, '0')}',
                                  () => _selectTime(context, true),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildTimePicker(
                                  'Closing Time',
                                  '${_closingTime.hour.toString().padLeft(2, '0')}:${_closingTime.minute.toString().padLeft(2, '0')}',
                                  () => _selectTime(context, false),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle submission
                          if (widget.ispost == true) {
                            Navigator.pop(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CarPostAdScreen(
                                      name: widget.name,
                                      namesub: widget.namesub,
                                      contactnumber: widget.number,
                                      country: widget.country ?? "",
                                      state: widget.state,
                                      city: widget.city,
                                      brand: widget.brand,
                                      mainheading: widget.mainheading,
                                      subheading: widget.subheading ?? [],
                                      services: widget.services ?? {},
                                      autotype: widget.autotype ?? "",
                                      workingdays: _workingDays,
                                      openingtime: _openingTime,
                                      closingtime: _closingTime,
                                      region: widget.region ?? "",
                                      // workinghours: widget.workinghours,
                                    ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          widget.ispost == true
                              ? 'Apply Filter'
                              : 'Save Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFFF0EFFF),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: red),
        ),
      ),
    );
  }

  Widget _buildTimePicker(String label, String time, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF718096)),
        ),
        const SizedBox(height: 8),
        Material(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF8F9FA),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(Icons.access_time, color: red, size: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
