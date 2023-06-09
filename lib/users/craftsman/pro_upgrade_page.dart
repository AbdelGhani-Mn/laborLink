import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborlink/widgets/app_large_text.dart';

class UpgradeToPro extends StatefulWidget {
  const UpgradeToPro({super.key});

  @override
  State<UpgradeToPro> createState() => _UpgradeToProState();
}

class _UpgradeToProState extends State<UpgradeToPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLargeText(text: 'Unavailable')
          ],
        ),
      ),
    );
  }
}