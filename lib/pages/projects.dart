// ignore_for_file: deprecated_member_use

import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          ProjectTile(
            projectName: '1. Bhashascript',
            projectImage: 'assets/images/ss1.png',
            projectDescription:
                'I am thrilled to share a major achievement – the launch of my newly created scripting language, BhashaScript, based on Python3, where I haveve added a unique twist by incorporating Marathi keywords! 🐍🌐 \nBhashaScript is more than just code; it is a celebration of language and innovation. 🎉 With Me',
            githubLink: 'https://github.com/VaibhavCodeClub/bhashascript',
          ),
          ProjectTile(
            projectName: 'Weather Application',
            projectImage: 'assets/images/one.png',
            projectDescription:
                'Explore my user-friendly Weather app for real-time updates and accurate forecasts. Stay informed about the current conditions with simplicity and ease, making it a go-to tool for your daily weather check.',
            githubLink: 'https://github.com/sapatevaibhav/weather',
          ),
        ],
      ),
              drawer: const MyDrawer(), 

    );
  }
}

class ProjectTile extends StatelessWidget {
  final String projectName;
  final String projectImage;
  final String projectDescription;
  final String githubLink;

  const ProjectTile({
    super.key,
    required this.projectName,
    required this.projectImage,
    required this.projectDescription,
    required this.githubLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(githubLink),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                projectName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              projectImage,
              width: double.infinity,
              // height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                projectDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
