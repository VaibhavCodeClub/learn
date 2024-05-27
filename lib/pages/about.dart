// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/const_dimensions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Learning app for kids',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16.0),
              const Text(
                'Version: 1.1.0',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Developed by: sapatevaibhav',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                AppConstants.description,
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 6.0),
              const Text(
                'Source code:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL(context, "https://github.com/VaibhavCodeClub/learn");
                },
                child: SvgPicture.asset(
                  'assets/images/git.svg',
                  width: 32.0,
                  height: 32.0,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Connect:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL(context, "https://github.com/sapatevaibhav");
                  },
                  child: SvgPicture.asset(
                    'assets/images/github.svg',
                    width: ConstantDimensions.widthSmall_Medium * 2,
                    height: ConstantDimensions.heightSmall_Medium * 2,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: ConstantDimensions.widthSmall_Medium),
                GestureDetector(
                  onTap: () {
                    _launchURL(context, "mailto:sapatevaibhav@duck.com");
                  },
                  child: SvgPicture.asset(
                    'assets/images/email.svg',
                    width: ConstantDimensions.widthSmall_Medium * 2,
                    height: ConstantDimensions.heightSmall_Medium * 2,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black ,
                  ),
                ),
                const SizedBox(width: ConstantDimensions.widthSmall_Medium),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        context, "https://linkedin.com/in/sapatevaibhav");
                  },
                  child: SvgPicture.asset(
                    'assets/images/linkedin.svg',
                    width: ConstantDimensions.widthSmall_Medium * 2,
                    height: ConstantDimensions.heightSmall_Medium * 2,
                  ),
                ),
                const SizedBox(width: ConstantDimensions.widthSmall_Medium),
                GestureDetector(
                  onTap: () {
                    _launchURL(context, "https://instagram.com/v.d.r.sapate");
                  },
                  child: SvgPicture.asset(
                    'assets/images/instagram.svg',
                    width: ConstantDimensions.widthSmall_Medium * 2,
                    height: ConstantDimensions.heightSmall_Medium * 2,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),

      ]
                )
                ],

              ),
          ),

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
