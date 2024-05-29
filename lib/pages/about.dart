// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Learn',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Center(
                child: Text(
                  'Learning app for kids',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'Version: 1.1.0'),
              const SizedBox(height: 8.0),
              _buildSectionContent(context, 'Developed by: sapatevaibhav'),
              const SizedBox(height: 16.0),
              _buildSectionTitle(context, 'Purpose of the App:'),
              const SizedBox(height: 8.0),
              _buildSectionContent(
                context,
                'Learn is designed to provide a fun and interactive learning experience for kids. '
                'Our mission is to make learning enjoyable and accessible, encouraging curiosity and discovery in young minds. '
                'The app covers a wide range of topics to help children build a solid foundation of knowledge in a playful and engaging way.',
              ),
              const SizedBox(height: 16.0),
              _buildSectionTitle(context, 'Features:'),
              const SizedBox(height: 8.0),
              _buildFeature(
                context,
                'A-Z Alphabets',
                'Learn the alphabets with examples and pronunciation guides, making it easier for kids to recognize and remember letters.',
              ),
              _buildFeature(
                context,
                'Animals',
                'Discover animals, hear their sounds, and learn how to pronounce their names, fostering a love for nature and wildlife.',
              ),
              _buildFeature(
                context,
                'Body Parts',
                'Learn about different body parts, how to pronounce them, and gain short information, promoting awareness of their own bodies.',
              ),
              const SizedBox(height: 16.0),
              _buildSectionTitle(context, 'Upcoming Features:'),
              const SizedBox(height: 8.0),
              _buildFeature(
                context,
                'Birds',
                'Explore different birds and their voices, adding to the child’s knowledge about avian species.',
              ),
              _buildFeature(
                context,
                'Solar System',
                'Gain knowledge about the solar system, sparking interest in space and astronomy.',
              ),
              _buildFeature(
                context,
                'Shapes',
                'Learn about different shapes and their properties, enhancing cognitive and visual-spatial skills.',
              ),
              const SizedBox(height: 16.0),
              _buildSectionTitle(context, 'Source Code:'),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  _launchURL(
                      context, "https://github.com/VaibhavCodeClub/learn");
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/git.svg',
                      width: 32.0,
                      height: 32.0,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'github.com/VaibhavCodeClub/learn',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              _buildSectionTitle(context, 'Connect:'),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  _buildIcon(context, 'https://github.com/sapatevaibhav',
                      'assets/images/github.svg'),
                  const SizedBox(width: 16.0),
                  _buildIcon(context, 'mailto:sapatevaibhav@duck.com',
                      'assets/images/email.svg'),
                  const SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          context, 'https://linkedin.com/in/sapatevaibhav');
                    },
                    child: SvgPicture.asset(
                      'assets/images/linkedin.svg',
                      width: 32.0,
                      height: 32.0,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  _buildIcon(context, 'https://instagram.com/v.d.r.sapate',
                      'assets/images/instagram.svg'),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnMorePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18.0),
                  ),
                  child: const Text('Learn More'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }

  Widget _buildSectionContent(BuildContext context, String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16.0,
        color: Theme.of(context).textTheme.bodyLarge!.color,
      ),
    );
  }

  Widget _buildFeature(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context, String url, String assetPath) {
    return GestureDetector(
      onTap: () {
        _launchURL(context, url);
      },
      child: SvgPicture.asset(
        assetPath,
        width: 32.0,
        height: 32.0,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn More',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Detailed Features:'),
            const SizedBox(height: 8.0),
            _buildFeature(
              context,
              'A-Z Alphabets',
              'Each letter of the alphabet is accompanied by an example image and pronunciation guide. Children can interact with the letters to hear how they sound, helping them to learn the alphabet in a fun and engaging way.',
            ),
            _buildFeature(
              context,
              'Animals',
              'The animals section introduces children to various animals, providing sounds and fun facts about each one. This feature helps children to develop a love for nature and learn more about the animal kingdom.',
            ),
            _buildFeature(
              context,
              'Body Parts',
              'This feature includes a diagram of the human body with clickable parts that provide information and pronunciation. It helps children to learn about their own bodies and understand the function of each part.',
            ),
            const SizedBox(height: 16.0),
            _buildSectionTitle(context, 'Upcoming Features:'),
            const SizedBox(height: 8.0),
            _buildFeature(
              context,
              'Birds',
              'The upcoming birds section will introduce various birds and their calls, helping children to recognize and learn more about avian species.',
            ),
            _buildFeature(
              context,
              'Solar System',
              'The solar system feature will teach children about the planets and other celestial bodies, fostering an interest in space and astronomy.',
            ),
            _buildFeature(
              context,
              'Shapes',
              'Children will learn about different shapes and their properties, which helps in developing cognitive and visual-spatial skills.',
            ),
            const SizedBox(height: 16.0),
            _buildSectionTitle(context, 'User Guide:'),
            const SizedBox(height: 8.0),
            _buildSectionContent(
              context,
              'Navigate through the app using the bottom navigation bar. Each section is designed to be interactive and user-friendly. Parents can help guide their children through each feature and use the app as a supplementary learning tool.',
            ),
            const SizedBox(height: 16.0),
            _buildSectionTitle(context, 'FAQ:'),
            const SizedBox(height: 8.0),
            _buildSectionContent(
              context,
              'Q: How do I use the app?\n'
              'A: Simply navigate through the sections using the bottom navigation bar. Each section is designed to be intuitive and easy to use.\n\n'
              'Q: Is the app free?\n'
              'A: Yes, the app is free to use. Some additional features may be available for purchase in the future.\n\n'
              'Q: How can I provide feedback?\n'
              'A: You can provide feedback through the contact options available in the About section of the app.',
            ),
            const SizedBox(height: 16.0),
            _buildSectionTitle(context, 'Feedback and Contact Information:'),
            const SizedBox(height: 8.0),
            _buildSectionContent(
              context,
              'We value your feedback! If you have any suggestions or issues, please contact us at sapatevaibhav@duck.com or through our social media channels.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }

  Widget _buildSectionContent(BuildContext context, String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16.0,
        color: Theme.of(context).textTheme.bodyLarge!.color,
      ),
    );
  }

  Widget _buildFeature(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
