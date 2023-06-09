import 'package:flutter/material.dart';
import 'package:laborlink/misc/colors.dart';
import 'package:laborlink/widgets/app_large_text.dart';
import 'package:laborlink/widgets/app_text.dart';
import 'package:laborlink/widgets/responsive_button.dart';

import 'signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
           margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/deal.png"),
          ),
           ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "Wlecome to"),
                    AppText(
                      text: "LaborLink",
                      size: 24,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Wether you're looking for a work, or a worker for home repairs.. You'll find it here!",
                          color: AppColors.textColor,
                        )),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ));
              },
              child: ResponsiveButton(
                text: "Get Started",
                width: 295,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}
