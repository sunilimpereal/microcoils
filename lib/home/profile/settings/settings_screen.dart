import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/screen.dart';
import '../widgets/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Column(
          children: [
            Column(
              children: [
                settingsTile(
                    ontap: () {
                      _launchUrl(url: "https://www.bluecoldref.com/company/about-us");
                      // Navigator.of(context).push(
                      //   CupertinoPageRoute(
                      //     builder: (context) => const DisclaimerScreen(),
                      //   ),
                      // );
                    },
                    icon: Icons.rule_rounded,
                    title: "About Us"),
                settingsTile(
                  ontap: () {
                    _launchUrl(url: "https://www.bluecoldref.com/company/contact-us");
                  },
                  icon: Icons.info,
                  title: "Contact Us",
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  ListTile settingsTile({
    required Function ontap,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      onTap: () {
        ontap();
      },
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
