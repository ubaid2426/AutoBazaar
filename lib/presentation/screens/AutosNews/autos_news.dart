import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AutoNewsScreen extends StatelessWidget {
  const AutoNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
         backgroundColor: red,
        title: const Text("Auto News", style: TextStyle(color: Colors.black)),
        // backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.filter_list, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NewsCard(
            category: "AUTOMOTIVE",
            title: "Tesla Model Z Launch – Is It the Future?",
            date: "10 April 2025",
            views: 248,
            likes: 42,
            imageUrl:
                "assets/images/home/range_rover.png",
          ),
          NewsCard(
            category: "TECH",
            title: "Self-driving Cars: The Revolution is Here",
            date: "08 April 2025",
            views: 135,
            likes: 26,
            imageUrl:
                "assets/images/home/suv.png",
          ),
          NewsCard(
            category: "INSIGHTS",
            title: "Top 5 EVs of 2025 – Which One Should You Pick?",
            date: "06 April 2025",
            views: 114,
            likes: 19,
            imageUrl:
                "assets/images/home/tesla_x.png",
            isPremium: true,
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String date;
  final int views;
  final int likes;
  final String imageUrl;
  final bool isPremium;

  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.date,
    required this.views,
    required this.likes,
    required this.imageUrl,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Text(date,
                        style:
                            const TextStyle(color: Colors.white70, fontSize: 12)),
                    const Spacer(),
                    const Icon(Icons.remove_red_eye,
                        size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Text("$views",
                        style:
                            const TextStyle(color: Colors.white70, fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.favorite,
                        size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Text("$likes",
                        style:
                            const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          if (isPremium)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Premium",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
