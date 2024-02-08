import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Web Developer'),
            subtitle: Text(
                'Company: GauravGO Technologies\nDuration: Sep 2023 - Oct 2023\nResponsibilities: Designed and developed responsive web applications using HTML, CSS, and JavaScript, implemented RESTful APIs, optimized website performance.'),
          ),
          ListTile(
            leading: Icon(Icons.android_sharp),
            title: Text('Android Developer'),
            subtitle: Text(
                'Company: CodeClause\nDuration: Oct 2023 - Nov 2023\nResponsibilities: Developed mobile applications using Flutter, maintained and improved existing codebase, collaborated with cross-functional teams.'),
          ),
        ],
      ),
              drawer: const MyDrawer(), 

    );
  }
}
