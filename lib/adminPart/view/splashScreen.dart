import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contant/appColor.dart';
import '../domain/sharedPre.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateBasedOnToken();
  }

  Future<void> navigateBasedOnToken() async {
    String? email = await SharedPrefs().getEmail();

    // Wait for 3 seconds before navigating
    Future.delayed(const Duration(seconds: 3), () {
      // Use SchedulerBinding to navigate after the current frame
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          // Ensure the widget is still mounted
          if (email != null && email.isNotEmpty) {
            // If the email exists, navigate to UserDashboard
            context.go('/dashboard');
          } else {
            // If no email, navigate to LoginScreen
            context.go('/login');
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset("assets/logo.png", height: 200, width: 200),

            // "Fast Quiz" Text
            Text(
              'Fast Quiz',
              style: GoogleFonts.acme(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: AppColor.splash_theme,
                letterSpacing: 1,
              ),
            ),

            // "tayari" Text
            Text(
              'Tayari',
              style: GoogleFonts.abhayaLibre(
                fontSize: 22,
                letterSpacing: 1,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
