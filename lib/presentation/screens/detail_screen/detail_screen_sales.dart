import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AutoSalesDetailScreen extends StatelessWidget {
  const AutoSalesDetailScreen({super.key});

  final String phoneNumber = "+923482337346"; // Your dealer's phone number without + sign

  void _makePhoneCall(String phoneNumber) async {
    final url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not make phone call";
    }
  }

  void _launchWhatsApp(String phoneNumber) async {
    final url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch WhatsApp";
    }
  }

  void _showContactOptions(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              type == 'whatsapp' ? FontAwesomeIcons.whatsapp : Icons.phone,
              size: 40,
              color: type == 'whatsapp' ? Colors.green : Colors.blueGrey,
            ),
            const SizedBox(height: 12),
            Text(
              type == 'whatsapp'
                  ? "Open WhatsApp to chat"
                  : "Make a phone call",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              type == 'whatsapp'
                  ? "Chat with the dealer on WhatsApp about this vehicle."
                  : "Call the dealer directly to inquire about this vehicle.",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                if (type == 'whatsapp') {
                  _launchWhatsApp(phoneNumber);
                } else {
                  _makePhoneCall(phoneNumber);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: Icon(
                type == 'whatsapp' ? FontAwesomeIcons.whatsapp : Icons.phone,
              ),
              label: Text(
                type == 'whatsapp' ? "Open WhatsApp" : "Call Now",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: red,
        elevation: 0,
        title: const Text("Car Details", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/home/audi_r8.png'),
                ),
                const SizedBox(height: 12),

                // Thumbnails
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/home/camaro.png',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 16),
                const Text(
                  "BMW M4 Competition",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Dealer: Auto Bazaar",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Excellent condition, low mileage, full-service history, and no accidents.",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),

                const Divider(height: 32),

                const Text(
                  "Specifications",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                _buildSpecRow("Make", "BMW"),
                _buildSpecRow("Model", "M4 Competition"),
                _buildSpecRow("Year", "2022"),
                _buildSpecRow("Mileage", "18,000 km"),
                _buildSpecRow("Fuel Type", "Petrol"),
                _buildSpecRow("Transmission", "Automatic"),
                _buildSpecRow("Color", "Black"),
                _buildSpecRow("Location", "Kuwait City"),

                const Divider(height: 32),

                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Text(
                  "This BMW M4 offers high performance with luxury and style. Features include a sunroof, leather seats, GPS, and sports package.",
                ),

                const Divider(height: 32),

                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "AUTO BAZAAR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Kuwait City, Kuwait"),
                          Text(
                            "Member since 2019",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                          onPressed:
                              () => _showContactOptions(context, 'whatsapp'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.phone, color: Colors.blueGrey),
                          onPressed:
                              () => _showContactOptions(context, 'phone'),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "KWD 25,000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Looking to sell your car?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: red),
                        child: const Text(
                          "Post Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
