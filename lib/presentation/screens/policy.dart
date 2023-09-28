import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/privacy_policy.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20, top: 60),
          child: Stack(
            children: [

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Html(
                    data: privacyPolicy,
                    onLinkTap: (url, context, attributes,) {
                      launchUrl(Uri.parse(url!));
                    },
                    style: {
                      'p': Style(
                        fontSize: FontSize(18.0),
                        color: Colors.black,
                      ),
                      'h1': Style(
                        fontSize: FontSize(24.0),
                        color: Colors.black,
                      ),
                      // Add more styles for other HTML tags as needed
                    },
                  ),
                ),
              ),
              Positioned(
                right: 20,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    width: 25,
                    height: 25,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
