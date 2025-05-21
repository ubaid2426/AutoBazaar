// import 'package:auto_size_text/auto_size_text.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/vehicle_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VehicleGridPager extends StatefulWidget {
  final void Function(VehicleCategory) onCategoryTap;
  final double height;
  final int count;
  final double ratio;
  final bool svg;
  final List<VehicleCategory> page;
  const VehicleGridPager({
    super.key,
    required this.page,
    required this.onCategoryTap,
    required this.height,
    required this.count,
    required this.ratio, required this.svg,
  });

  @override
  State<VehicleGridPager> createState() => _VehicleGridPagerState();
}

class _VehicleGridPagerState extends State<VehicleGridPager> {
  final PageController _controller = PageController();

  List<List<VehicleCategory>> get pages {
    const int itemsPerPage = 12; // 3 rows of 3 cards
    List<List<VehicleCategory>> paginated = [];
    for (int i = 0; i < widget.page.length; i += itemsPerPage) {
      paginated.add(
        widget.page.sublist(
          i,
          (i + itemsPerPage) > widget.page.length
              ? widget.page.length
              : i + itemsPerPage,
        ),
      );
    }
    return paginated;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height, // Adjust based on image/card size
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages[index].length,
                // padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.count,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: widget.ratio,
                ),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => widget.onCategoryTap(pages[index][i]),

                    // () {
                    //   final title = pages[index][i].name;

                    //   Widget? screen;
                    //   switch (title) {
                    //     case "Car":
                    //         screen = const VehicleDetail(title: 'All Car Data',);
                    //       break;
                    //   }
                    //   if (screen != null) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => screen!),
                    //     );
                    //   }
                    // },
                    child: _buildCategoryCard(pages[index][i], widget.svg),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: pages.length,
          effect: WormEffect(
            activeDotColor: Colors.black,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(VehicleCategory category, bool svg) {
    return Column(
      children: [
        // Image Card
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
            clipBehavior: Clip.antiAlias,
          // padding: const EdgeInsets.all(10),
          child: svg ? SvgPicture.asset(
            category.imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            // scale: 1.5,
          ):
          Image.asset(
            category.imagePath,
            // height: 50,
            fit: BoxFit.contain,
            // scale: 1.5,
          ),
        ),

        const SizedBox(height: 8),

        // Title below card
        Text(
          category.name,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: black, // dark navy blue
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
