import 'package:curalog/config/theme/placebo_colors.dart';
import 'package:curalog/config/theme/placebo_typography.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:curalog/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curalog',
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        extensions: <ThemeExtension<dynamic>>[PlaceboColors.light, textTheme],
        // Override default Text('') styling to placebo body
        textTheme:
            Theme.of(context).textTheme.copyWith(bodyMedium: textTheme.body),
      ),
      home: const SplashScreen(),
    );
  }
}
