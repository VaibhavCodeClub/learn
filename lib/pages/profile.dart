import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/vaibhav.png'), 
            ),
            SizedBox(height: 20),
            Text(
              'Sapate Vaibhav',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'sapatevaibhav@duck.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'I am a passionate Flutter developer with experience in building mobile applications. I enjoy working with various Flutter widgets and exploring new features of the framework. In my free time, I like to contribute to open-source projects and learn about emerging technologies.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
              drawer: const MyDrawer(), 

    );
  }
}
