import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeTemplate extends StatelessWidget {
  const WelcomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to the flutter flash template"),
      ),
      body: Column(
        children: [
          const Text(
            'Learn about the folder structure and files in this template:',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _launchURL(
                  'https://parmendras-newsletter-e9b66f.beehiiv.com/p/mastering-state-management-clean-architecture-with-bloc'); // Replace with your article URL
            },
            child: const Text(
              'Read this article',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'This template provides a basic setup for folders and files, ensuring a clear and maintainable code structure for your Flutter projects.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
