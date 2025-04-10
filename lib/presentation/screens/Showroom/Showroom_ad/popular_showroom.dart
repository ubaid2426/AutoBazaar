import 'package:autobazzaar/presentation/widgets/showroom_widget.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/models/showroom_model.dart';
// import 'package:autobazzaar/presentation/widgets/showroom_card.dart';

class PopularShowrooms extends StatefulWidget {
  final List<Showroom> showrooms;

  const PopularShowrooms({Key? key, required this.showrooms}) : super(key: key);

  @override
  State<PopularShowrooms> createState() => _PopularShowroomsState();
}

class _PopularShowroomsState extends State<PopularShowrooms> {
    final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular Showrooms",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
                controller: _scrollController,
              // shrinkWrap: true,
              itemCount: widget.showrooms.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // two columns
                crossAxisSpacing: 5,
                mainAxisSpacing: 45,
                childAspectRatio: 2/5, // width / height
              ),
              itemBuilder: (context, index) {
                final showroom = widget.showrooms[index];
                return ShowroomCard(showroom: showroom);
              },
            ),
          ),
        ],
      ),
    );
  }
}
