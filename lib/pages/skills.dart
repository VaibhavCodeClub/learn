import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: _skillsList.length,
          itemBuilder: (context, index) {
            final skill = _skillsList[index];
            return ListTile(
              title: Text(
                skill.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(skill.subtitle),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 75, // Width of the separator
              height: 1, // Height of the separator
              color: Colors.grey,
            );
          },
        ),
      ),
              drawer: const MyDrawer(), 

    );
  }
}

class Skill {
  final String title;
  final String subtitle;

  Skill(this.title, this.subtitle);
}

// List of skills
final List<Skill> _skillsList = [
  Skill('Flutter', 'Cross-platform mobile app development framework'),
  Skill('Dart', 'Programming language used for Flutter development'),
  Skill('Python', 'High-level programming language'),
  Skill('Java', 'General-purpose programming language'),
  Skill('Linux', 'Operating system kernel'),
  Skill('Git/GitHub/GitLab',
      'Version control system and web-based hosting service'),
  Skill('HTML', 'Markup language for creating web pages'),
  Skill('CSS',
      'Stylesheet language used for describing the presentation of a document written in HTML'),
  Skill('JavaScript',
      'Programming language used to create interactive effects within web browsers'),
  Skill('VS Code', 'Source-code editor developed by Microsoft'),
  Skill('Android Studio',
      'Integrated development environment (IDE) for Android app development'),
  Skill('ngrok',
      'Secure introspectable tunnels to localhost webhook development tool and debugging tool'),
  Skill('PHP', 'Server-side scripting language designed for web development'),
  Skill('MySQL', 'Relational database management system'),
  Skill('SQLite',
      'Self-contained, serverless, zero-configuration, transactional SQL database engine'),
  Skill('Blender',
      'Open-source 3D computer graphics software toolset used for creating animated films, visual effects, art, 3D printed models, interactive 3D applications, and video games'),
];
