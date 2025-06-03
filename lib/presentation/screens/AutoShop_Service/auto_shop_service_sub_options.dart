import 'dart:ui';

// import 'package:auto_size_text/auto_size_text.dart';
import 'package:autobazzaar/components/listing_card_design_grid.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/car_ad.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/vehicle_detail.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter_service.dart';
// import 'package:autobazzaar/presentation/screens/detail_screen/detail_screen.dart';
// import 'package:autobazzaar/presentation/widgets/horizontal_filter.dart';
import 'package:autobazzaar/presentation/widgets/horizontal_filter_service.dart';
// import 'package:autobazzaar/presentation/widgets/shortfilter.dart';
import 'package:flutter/material.dart';

class AutoShopServiceSubOptions extends StatefulWidget {
  final String title;
  final List<String> items;
  const AutoShopServiceSubOptions({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  _AutoShopServiceSubOptionsState createState() =>
      _AutoShopServiceSubOptionsState();
}

class _AutoShopServiceSubOptionsState extends State<AutoShopServiceSubOptions> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    // final List<Car> allCars = [...premiumCars, ...carList];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
            IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainFilterService(items: widget.items),
              // builder: (context) => const QiblaApp(),
            ),
          );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          HorizontalFilterService(items: widget.items, mainCategory: 'Service Options',), // your filter widget
          SizedBox(height: 10),
          // ShortFilter(),
          Text(
            "Top Featured",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: black,
            ),
            textAlign: TextAlign.right,
          ),
          Expanded(child: ListingCardDesignGrid(rateshow: true, timeshow: true, partcondition: false, experience: true,))
          // SizedBox(height: 10 ,),
          // Expanded(
          //   child:
          //       isGrid
          //           ? _buildGridView(premiumCars, carList)
          //           : _buildListView(premiumCars, carList),
          // ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Car> premiumCars, List<Car> queuedCars) {
    final List<Car> allCars = [...premiumCars, ...queuedCars];
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: allCars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final isPremium = index < premiumCars.length;
        final car =
            index < premiumCars.length
                ? premiumCars[index]
                : queuedCars[index - premiumCars.length];
        return GridCard(car, isPremium: isPremium, rateshow: true, timeshow: false,);
      },
    );
  }

  Widget _buildListView(List<Car> premiumCars, List<Car> queuedCars) {
    final List<Car> allCars = [...premiumCars, ...queuedCars];
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: allCars.length,
      itemBuilder: (context, index) {
        final isPremium = index < premiumCars.length;
        final car =
            index < premiumCars.length
                ? premiumCars[index]
                : queuedCars[index - premiumCars.length];
        return ListCard(car, isPremium: isPremium, rateshow: true, timeshow: false,);
      },
    );
  }
}




// class ListCard extends StatelessWidget {
//   final Car data;
//   final bool isPremium;

//   const ListCard(this.data, {this.isPremium = false, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DetailScreen()),
//         );
//       },
//       child: Card(
//         color: isPremium ? Colors.amber.shade50 : Colors.white,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Container(
//             height: 250,
//             decoration: BoxDecoration(
//               // color: lightgrey,
//               // borderRadius: BorderRadius.circular(16),
//               image: DecorationImage(
//                 image: AssetImage(data.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Bottom 40% blur overlay
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   height: 250 * 0.42, // 40% height
//                   child: ClipRect(
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//                       child: Container(
//                         color: Colors.black.withOpacity(0.2),
//                         padding: const EdgeInsets.all(0),
//                         child: _buildInfoContent(context),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoContent(context) {
//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(height: 5),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.60 - 20,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 data.name,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 data.description,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontSize: 13, color: Colors.white70),
//               ),
//               // const SizedBox(height: 4),
//               Row(
//                 children: [
//                   const Icon(Icons.location_pin, color: Colors.white, size: 16),
//                   // const SizedBox(width: 4),
//                   Text(
//                     "data.location",
//                     style: const TextStyle(fontSize: 13, color: Colors.white),
//                   ),
//                 ],
//               ),
//               // const SizedBox(height: 4),
//               Row(
//                 children: [
//                   _buildStarRating(data.stars),
//                   const SizedBox(width: 4),
//                   Text(
//                     '${data.stars}/5',
//                     style: const TextStyle(fontSize: 12, color: Colors.white70),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.40 - 20,
//           child: Align(
//             // alignment: Alignment.bottomRight,
//             child: ElevatedButton(
//               onPressed: () {
//                 //               Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => DetailScreen(),
//                 //     // builder: (context) => const QiblaApp(),
//                 //   ),
//                 // );
//                 // navigation logic here
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: red,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//               ),
//               child: const Text(
//                 "Get Directions",
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStarRating(double rating) {
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;

//     return Row(
//       children: List.generate(5, (index) {
//         if (index < fullStars) {
//           return const Icon(Icons.star, color: Colors.amber, size: 14);
//         } else if (index == fullStars && hasHalfStar) {
//           return const Icon(Icons.star_half, color: Colors.amber, size: 14);
//         } else {
//           return const Icon(Icons.star_border, color: Colors.amber, size: 14);
//         }
//       }),
//     );
//   }
// }

// // }

// class GridCard extends StatelessWidget {
//   final Car data;
//   final bool isPremium;
//   const GridCard(this.data, {this.isPremium = false, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DetailScreen()),
//         );
//       },
//       child: Card(
//         elevation: 5,
//         color: isPremium ? Colors.amber.shade50 : Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Top Icons Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: const [
//                           Icon(Icons.push_pin, color: red),
//                           SizedBox(width: 5),
//                           Icon(Icons.emoji_events, color: Colors.amber),
//                         ],
//                       ),
//                       Row(
//                         children: const [
//                           Icon(
//                             Icons.bookmark_border,
//                             size: 20,
//                             color: Colors.black87,
//                           ),
//                           SizedBox(width: 8),
//                           Icon(Icons.share, size: 20, color: Colors.black87),
//                         ],
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 8),

//                   // Car Image
//                   Center(
//                     child: Image.asset(
//                       data.image,
//                       height: 90,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   const SizedBox(height: 5),

//                   // Car Name
//                   AutoSizeText(
//                     data.name,
//                     minFontSize: 10,
//                     style: const TextStyle(fontWeight: FontWeight.w400),
//                   ),

//                   // Car Description
//                   Text(
//                     data.description,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),

//                   const SizedBox(height: 5),

//                   // Price
//                   Text(
//                     "KWD ${data.discountPrice.toStringAsFixed(0)}",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 5),

//                   // Rating
//                   Row(
//                     children: [
//                       _buildStarRating(data.stars),
//                       const SizedBox(width: 4),
//                       Text(
//                         data.totalVotes.toString(),
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Premium Badge
//             if (isPremium)
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 6,
//                     vertical: 2,
//                   ),
//                   decoration: const BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Premium',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStarRating(double rating) {
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;

//     return Row(
//       children: List.generate(5, (index) {
//         if (index < fullStars) {
//           return const Icon(Icons.star, color: Colors.amber, size: 14);
//         } else if (index == fullStars && hasHalfStar) {
//           return const Icon(Icons.star_half, color: Colors.amber, size: 14);
//         } else {
//           return const Icon(Icons.star_border, color: Colors.amber, size: 14);
//         }
//       }),
//     );
//   }
// }


