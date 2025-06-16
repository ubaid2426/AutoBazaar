import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../models/brand_item.dart';

class BrandDropdown extends StatefulWidget {
  final List<BrandItem> brands;
  final Function(BrandItem) onSelected;

  const BrandDropdown({
    super.key,
    required this.brands,
    required this.onSelected,
  });

  @override
  _BrandDropdownState createState() => _BrandDropdownState();
}

class _BrandDropdownState extends State<BrandDropdown> {
  BrandItem? selectedBrand;

  void _showBrandPopup() {
    List<BrandItem> filteredBrands = List.from(widget.brands);
    final TextEditingController _searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 400,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [blacklight, red],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Close Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select a Brand",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),

                  // Search Field
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setStateDialog(() {
                        filteredBrands = widget.brands
                            .where((brand) => brand.name.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search brand...",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Brand Grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: filteredBrands.length,
                      itemBuilder: (context, index) {
                        final brand = filteredBrands[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBrand = brand;
                            });
                            widget.onSelected(brand);
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                // padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  brand.imagePath,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                brand.name,
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showBrandPopup,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            selectedBrand == null
                ? Text("Select Brand", style: TextStyle(color: Colors.grey))
                : Row(
                    children: [
                      Image.asset(selectedBrand!.imagePath, height: 30),
                      SizedBox(width: 10),
                      Text(selectedBrand!.name, style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
