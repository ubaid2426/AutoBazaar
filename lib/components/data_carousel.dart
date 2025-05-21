import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/car_ad.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DataCarousel extends StatefulWidget {
  final bool show;
  final List<Car> carList;
  final bool shouldShowTilde;
  final bool rateshow;
  final bool timeshow;
  const DataCarousel({
    super.key,
    required this.carList,
    required this.show,
    required this.shouldShowTilde,
    required this.rateshow, required this.timeshow,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DataCarouselState createState() => _DataCarouselState();
}

class _DataCarouselState extends State<DataCarousel> {
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
    List<Car> firstHalf = widget.carList.sublist(0, widget.carList.length ~/ 2);
    List<Car> secondHalf = widget.carList.sublist(widget.carList.length ~/ 2);

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
    List<Car> carList,
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
                // autoPlayAnimationDuration: ,
                enlargeCenterPage: true,
                viewportFraction: 0.50,
                initialPage: 1,
                autoPlay: true,
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

  Widget _buildCarCard(Car car) {
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
              // Icons Row
              if (widget.show == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.push_pin, color: red),

                        // Image.asset('assets/icons/pin.png', width: 20),
                        const SizedBox(width: 5),
                        Icon(Icons.emoji_events, color: Colors.amber),

                        // Image.asset('assets/icons/badge.png', width: 20),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 20,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.share, size: 20, color: Colors.black87),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 8),

              // Car Image
              Center(
                child: Image.asset(car.image, height: 90, fit: BoxFit.contain),
              ),

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

              const SizedBox(height: 5),

              // Price
              // Text(
              //   "Initial Price: KWD ${car.discountPrice.toStringAsFixed(0)}",
              //   style: const TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Text(
                "Price: KWD${widget.shouldShowTilde ? '~' : ''} ${car.discountPrice.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Rating & Votes
              if (widget.rateshow == true)
                Row(
                  children: [
                    _buildStarRating(car.stars),
                    const SizedBox(width: 4),
                    Text(
                      car.totalVotes.toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              if (widget.timeshow == true)
                Text(
                  car.timeAgo.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
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
