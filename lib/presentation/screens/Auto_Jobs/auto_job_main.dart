// import 'package:autobazzaar/components/Header.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
// import 'package:autobazzaar/components/data_carousel.dart';
// import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
// import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
// import 'package:flutter/material.dart';

// class AutoJobMain extends StatelessWidget {
//   const AutoJobMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       drawer: MainDrawer(), // Left side drawer
//       appBar:CustomSearchAppBar(backarrow: true,),
//       body: ListView(
//         children: [
//           SizedBox(height: 20),
//           PromoCarousel(promoList: promoCards),
//           SizedBox(height: 10),
//           TopCategories(
//             showAutoClassified: false,
//             categories: autojobcategories,
//           ), // Will hide it
//           // PromoCarousel(promoList: promoCards),
//           SizedBox(height: 10),
//           // HorizontalFilter(),
//           // ShortFilter(),
//           Header(
//             title: "Auto Mechanic",
//             onViewAll: () {
//               //        Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => ,
//               //     // builder: (context) => const QiblaApp(),
//               //   ),
//               // );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Top User Ads",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           DataCarousel(carList: carList, show: true, shouldShowTilde: true, rateshow:true, timeshow: false,),
//           Header(
//             title: "Mechanical Engineer",
//             onViewAll: () {
//               //        Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => ,
//               //     // builder: (context) => const QiblaApp(),
//               //   ),
//               // );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Top User Ads",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           DataCarousel(carList: carList, show: true, shouldShowTilde: true, rateshow: true, timeshow: false,),
//           Header(
//             title: "Body Shop Technician",
//             onViewAll: () {
//               //        Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => ,
//               //     // builder: (context) => const QiblaApp(),
//               //   ),
//               // );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Top User Ads",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           DataCarousel(carList: carList, show: true, shouldShowTilde: true, rateshow: true, timeshow: false,),
//         ],
//       ),
//     );
//   }
// }
