import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/part_ad.dart';
// import 'package:autobazzaar/models/car_ad.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PartCarousel extends StatefulWidget {
  final List<Part> carList;

  const PartCarousel({super.key, required this.carList});

  @override
  _PartCarouselState createState() => _PartCarouselState();
}

class _PartCarouselState extends State<PartCarousel> {
  final CarouselSliderController _controller1 = CarouselSliderController();
  final CarouselSliderController _controller2 = CarouselSliderController();
  double _currentIndex1 = 0;
  double _currentIndex2 = 0;

  void _goToPrevious1() {
    if (_currentIndex1 > 0) {
      setState(() => _currentIndex1--);
      _controller1.previousPage();
    }
  }

  void _goToNext1() {
    if (_currentIndex1 < widget.carList.length ~/ 2 - 1) {
      setState(() => _currentIndex1++);
      _controller1.nextPage();
    }
  }

  void _goToPrevious2() {
    if (_currentIndex2 > 0) {
      setState(() => _currentIndex2--);
      _controller2.previousPage();
    }
  }

  void _goToNext2() {
    if (_currentIndex2 < widget.carList.length ~/ 2 - 1) {
      setState(() => _currentIndex2++);
      _controller2.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.carList.length > 15
        ? _buildTwoCarousels()
        : _buildSingleCarousel();
  }

  // ✅ Show Two Carousels if More than 15 Cars
  Widget _buildTwoCarousels() {
    List<Part> firstHalf = widget.carList.sublist(0, widget.carList.length ~/ 2);
    List<Part> secondHalf = widget.carList.sublist(widget.carList.length ~/ 2);

    return Column(
      children: [
        _buildCarousel(
          firstHalf,
          _controller1,
          _currentIndex1,
          _goToPrevious1,
          _goToNext1,
        ),
        const SizedBox(height: 20), // Space between carousels
        _buildCarousel(
          secondHalf,
          _controller2,
          _currentIndex2,
          _goToPrevious2,
          _goToNext2,
        ),
      ],
    );
  }

  // ✅ Show Single Carousel if 15 or Fewer Cars
  Widget _buildSingleCarousel() {
    return _buildCarousel(
      widget.carList,
      _controller1,
      _currentIndex1,
      _goToPrevious1,
      _goToNext1,
    );
  }

  // 🏎️ Common Carousel Builder
  Widget _buildCarousel(
    List<Part> carList,
    CarouselSliderController controller,
    double currentIndex,
    VoidCallback goToPrevious,
    VoidCallback goToNext,
  ) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                viewportFraction: 0.50,
                initialPage: 1,
                autoPlay: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index.toDouble();
                  });
                },
              ),
              itemCount: carList.length,
              itemBuilder: (context, index, realIndex) {
                return _buildCarCard(carList[index]);
              },
            ),

            // Left Button (Previous)
            Positioned(
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: currentIndex > 0 ? red : Colors.grey,
                ),
                onPressed: currentIndex > 0 ? goToPrevious : null,
              ),
            ),

            // Right Button (Next)
            Positioned(
              right: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: currentIndex < carList.length - 1 ? red : Colors.grey,
                ),
                onPressed: currentIndex < carList.length - 1 ? goToNext : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 🏎️ Car Card Widget
  Widget _buildCarCard(Part car) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Card(
        color: silver,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(car.image, height: 90, fit: BoxFit.cover),
              const SizedBox(height: 10),

              // Car Name
              Text(
                car.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Car Description
              Text(
                car.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 5),
              Text(
                "KWD ${car.fullPrice.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 5),

              // Star Rating & Reviews
              Row(
                spacing: 5,
                children: [
                  _buildStarRating(car.stars),
                  Text(
                    car.totalVotes.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ⭐️ Star Rating Widget
  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 14);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 14);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 14);
        }
      }),
    );
  }
}
