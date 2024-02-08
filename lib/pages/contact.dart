import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const CircleAvatar(
            //   radius: 80,
            //   backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
            // ),
            // const SizedBox(height: 20),
            // const Text(
            //   'Contact',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Android Developer',
            //   style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.grey[600],
            //   ),
            // ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  _buildInfoRow(Icons.email, 'Email', 'sapatevaibhav@duck.com'),
                  _buildInfoRow(Icons.phone, 'Phone', '+91 8408 021518'),
                  _buildInfoRow(Icons.location_on, 'Address',
                      '92, Vaishnavi Sadan, Kewad,\nKaij, 431123.'),
                ],
              ),
            ),
          ],
        ),
      ),
              drawer: const MyDrawer(), 

    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey[600],
            size: 24,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
