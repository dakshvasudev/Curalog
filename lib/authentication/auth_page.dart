import "package:curalog/authentication/login_or_register.dart";
import "package:curalog/screens/bottom_nav_home_page.dart";
import "package:curalog/screens/onboarding/onboarding.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const ScreenWithBottomNav();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
