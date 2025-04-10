import 'package:autobazzaar/presentation/screens/PaymentMethod/add_payment_method_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Payment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: Icon(Icons.apple, size: 40),
            title: Text('Apple ID'),
            subtitle: Text('Balance: PKR2,6000', style: TextStyle(color: Colors.blue)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.orange, size: 40),
            title: Text('Master Card'),
            subtitle: Text('****6356', style: TextStyle(color: Colors.blue)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.blue, size: 40),
            title: Text('Visa'),
            subtitle: Text('****5645', style: TextStyle(color: Colors.blue)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPaymentMethodScreen()));
              },
              child: Text(
                'Add Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
