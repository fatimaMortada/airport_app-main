import 'package:airport_app/fearures/settings/widgets/settings_tile.dart';
import 'package:airport_app/utils/mds.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildMainCategory(context);
  }

  Widget _buildMainCategory(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: whiteColor,
          ),
        ),
      ),
      body: ListView(children: [
        SettingsTile(
          icon: Icons.person_outline,
          color: Colors.purple,
          text: "Personal Info",
          onTap: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        SettingsTile(
          icon: Icons.credit_card,
          color: Colors.pink,
          text: "Payment",
          onTap: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        SettingsTile(
          icon: Icons.phone,
          color: Colors.green,
          text: "Contact Us",
          onTap: () async {
            const url = 'tel:123456789';
            if (!await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            )) {
              throw Exception('Could not launch $url');
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        _divider(),
        const SizedBox(
          height: 16,
        ),
        SettingsTile(
          icon: Icons.info_outline,
          color: Colors.blueGrey.shade800,
          text: "FAQs",
          onTap: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        SettingsTile(
          icon: Icons.policy,
          color: Colors.blueGrey.shade800,
          text: "Privacy Policy",
          onTap: () {
            Uri url =
                Uri.parse("https://pub.dev/packages/url_launcher/example");
            launchUrl(url);
          },
        ),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}

Widget _divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}
