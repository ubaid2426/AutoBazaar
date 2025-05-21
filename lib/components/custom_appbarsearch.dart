// import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/screens/main_filter.dart'; // adjust the import as needed

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String location;
  final bool backarrow;
  // final String type;
  const CustomSearchAppBar({
    super.key,
    this.location = "Kuwait",
    required this.backarrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: red,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder:
                    (context) => IconButton(
                      icon:
                          backarrow
                              ? Icon(Icons.arrow_back, color: Colors.white)
                              : Icon(Icons.menu, color: Colors.white),
                      onPressed:
                          () =>
                              backarrow
                                  ? Navigator.pop(context)
                                  : Scaffold.of(context).openDrawer(),
                    ),
              ),
              Column(
                children: [
                  const Text(
                    "Your location",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainFilterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Search Bar
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search any Product..",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
