import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/listing_main.dart';
import 'package:flutter/material.dart';
// import 'dummy_data.dart';

class MyListingsScreen extends StatefulWidget {
  const MyListingsScreen({super.key});

  @override
  _MyListingsScreenState createState() => _MyListingsScreenState();
}

class _MyListingsScreenState extends State<MyListingsScreen> {
  String selectedStatus = "Active";
  String selectedSort = "Today";

  List<Listing> getFilteredListings() {
    List<Listing> filtered = dummyListings
        .where((listing) => listing.status == selectedStatus)
        .toList();

    filtered.sort((a, b) {
      switch (selectedSort) {
        case "Today":
          return b.dateAdded.compareTo(a.dateAdded);
        case "This week":
          return b.dateAdded.compareTo(a.dateAdded);
        case "This month":
          return b.dateAdded.compareTo(a.dateAdded);
        case "Latest":
          return b.dateAdded.compareTo(a.dateAdded);
        case "Oldest":
          return a.dateAdded.compareTo(b.dateAdded);
        default:
          return 0;
      }
    });

    return filtered;
  }

  void showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Radio(
                  value: "Today",
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: Text("Today"),
              ),
              ListTile(
                leading: Radio(
                  value: "This week",
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: Text("This week"),
              ),
              ListTile(
                leading: Radio(
                  value: "This month",
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: Text("This month"),
              ),
              ListTile(
                leading: Radio(
                  value: "Latest",
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: Text("Latest"),
              ),
              ListTile(
                leading: Radio(
                  value: "Oldest",
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: Text("Oldest"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Listing> listings = getFilteredListings();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Listings"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs for filtering
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ["Active", "Closed", "Archived"].map((status) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStatus = status;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontWeight: selectedStatus == status
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (selectedStatus == status)
                      Container(
                        height: 2,
                        width: 50,
                        color: Colors.black,
                      )
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          // Sort Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                onPressed: showSortOptions,
                icon: Icon(Icons.sort),
                label: Text("Sort"),
              ),
            ],
          ),
          Expanded(
            child: listings.isEmpty
                ? Center(child: Text("No listings found"))
                : GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: listings.length,
                    itemBuilder: (context, index) {
                      final listing = listings[index];
                      return Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(listing.imageUrl, height: 100),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listing.title),
                                  Text(
                                    "KWD ${listing.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "⭐ ${listing.rating} (${listing.reviews})",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
