import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/config/theme/placebo_colors.dart';
import 'package:curalog/config/theme/placebo_typography.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      title: const Text('Curalog'),
      body: Center(
        child: Text(
          'Welcome to Curalog',
          style: typography(context).largeTitle,
        ),
      ),
    );
  }
}
