import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/Signin_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("client"),
        actions: [
          IconButton(
            onPressed: () {
               FirebaseAuth.instance.signOut().then((value) {
                              // ignore: avoid_print
                              print("signed out");
                              Navigator.pushReplacement(context, 
                              MaterialPageRoute(builder: (context) => const SignInPage()));
                            });
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
    );
  }
}