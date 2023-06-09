// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laborlink/pages/Signin_page.dart';
import 'package:laborlink/users/craftsman/craftsman_editing_page.dart';
import 'package:laborlink/users/craftsman/craftsman_home_page.dart';

import 'pages/welcome_page.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const CraftsmanProfileEditing();
          } else {
            return const WelcomePage();
          }
        }

        ),
      ),
    );
  }
}