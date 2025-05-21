import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/core/theme/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String location;
  final VoidCallback? onFilterTap;
  final bool backarrow;
  const CustomSliverAppBar({
    super.key,
    this.location = "Kuwait",
    this.onFilterTap,
    required this.backarrow,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: red,
      floating: true,
      snap: true,
      expandedHeight: 140,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder:
                        (context) => IconButton(
                          icon:
                              backarrow
                                  ? SizedBox(width: 40)
                                  : const Icon(Icons.menu, color: red),
                          onPressed:
                              () =>
                                  backarrow
                                      ? null
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
                    onPressed: onFilterTap,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 44,
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
        ),
      ),
    );
  }
}
