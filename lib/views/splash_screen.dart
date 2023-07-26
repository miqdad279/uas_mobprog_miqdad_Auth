import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_mobprog_miqdad/views/started_screen.dart';

import 'home.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    // Simulate a delay before navigating to the next screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if the user is already logged in
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // User is logged in, navigate to the HomeScreen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // User is not logged in, navigate to the SignInScreen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'Book Review',
              style: GoogleFonts.poppins(
                  color: const Color(0xff274591),
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
