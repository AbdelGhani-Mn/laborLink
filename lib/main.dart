import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laborlink/auth.dart';
import 'package:laborlink/misc/colors.dart';
import 'package:laborlink/users/utils/craftsman_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CraftsmanPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LaborLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.black,
      ),
      home: const Auth(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,         
        ),
      ),
    );
  }
}
