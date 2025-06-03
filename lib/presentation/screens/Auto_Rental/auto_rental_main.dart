import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Auto_Rental/components/rental_Listing_card.dart';
import 'package:autobazzaar/presentation/screens/Auto_Rental/screens/Rental_Detail/rental_detail.dart';
import 'package:flutter/material.dart';

class AutoRentalMain extends StatelessWidget {
  const AutoRentalMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomSliverAppBar(),
      body: CustomScrollView(
        // child: Row(
        slivers: [
          const CustomSliverAppBar(location: "Kuwait", backarrow: true),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              PromoCarousel(promoList: promoCards),
              const SizedBox(height: 10),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RentalDetailsScreen(),
                      ),
                    );
                  },
                  child: CarCard(
                    imageUrl: 'assets/images/home/audi_r8.png',
                    title: 'Hyundai Santa Fe',
                    type: 'SUV',
                    rating: 5.0,
                    price: 'PKR 7000',
                    transmission: 'Automatic',
                    fuel: 'Fuel',
                    seats: '5 seats',
                    isFavorite: true,
                  ),
                );
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
