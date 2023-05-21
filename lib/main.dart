import 'package:flutter/material.dart';
import 'package:shopping_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    color: Colors.grey,
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: {
      '/login': (context) => const loginpage(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), navigateToNoteList);
  }

  void navigateToNoteList() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to JMMM Shop',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Press on Login to explore our shop',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: navigateToNoteList,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
