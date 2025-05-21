import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/state_area.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/fuel.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/Insuranced.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  TextEditingController _transmissionController = TextEditingController();
  TextEditingController _paymentController = TextEditingController();

  List<String> filteredTransmissions = used;
  List<String> filteredPayments = payment;

  String? selectedTransmission;
  String? selectedPayment;

  @override
  void initState() {
    super.initState();
    _transmissionController.addListener(_filterTransmission);
    _paymentController.addListener(_filterPayment);
  }

  void _filterTransmission() {
    String query = _transmissionController.text.toLowerCase();
    setState(() {
      filteredTransmissions = used
          .where((t) => t.toLowerCase().contains(query))
          .toList();
    });
  }

  void _filterPayment() {
    String query = _paymentController.text.toLowerCase();
    setState(() {
      filteredPayments =
          payment.where((p) => p.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _transmissionController.dispose();
    _paymentController.dispose();
    super.dispose();
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required TextEditingController controller,
    required List<String> items,
    required String? selectedItem,
    required void Function(String) onItemTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Expanded(child: Text(subtitle)),
          ],
        ),
        SizedBox(height: 16),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 16),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final isSelected = selectedItem == item;
            return Card(
              margin: EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(item, style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Checkbox(
                  value: isSelected,
                  onChanged: (_) => onItemTap(item),
                ),
                onTap: () => onItemTap(item),
              ),
            );
          },
        ),
        SizedBox(height: 24),
      ],
    );
  }

  void _handleNext() {
    print("Transmission Selected: $selectedTransmission");
    print("Payment Method Selected: $selectedPayment");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StateArea()),
    );
  }

  bool get isNextEnabled =>
      selectedTransmission != null && selectedPayment != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Payment Method")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection(
              title: "Is the Car used ?",
              subtitle: "Choose the condition of car you want to sell",
              controller: _transmissionController,
              items: filteredTransmissions,
              selectedItem: selectedTransmission,
              onItemTap: (value) {
                setState(() {
                  selectedTransmission = value;
                });
              },
            ),
            _buildSection(
              title: "Payment Method",
              subtitle: "Choose the appropriate payment method",
              controller: _paymentController,
              items: filteredPayments,
              selectedItem: selectedPayment,
              onItemTap: (value) {
                setState(() {
                  selectedPayment = value;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: isNextEnabled ? _handleNext : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: red,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Next >", style: TextStyle(color: black),),
            ),
          ],
        ),
      ),
    );
  }
}
