import 'package:curalog/config/theme/placebo_colors.dart';
import 'package:curalog/config/theme/placebo_typography.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:io';

import 'package:flutter/material.dart';

PlaceboColors colors(BuildContext context) {
  if (Platform.isIOS) {
    return PlaceboColors.light;
  }
  return Theme.of(context).extension<PlaceboColors>() ?? PlaceboColors.light;
}

PlaceboTypography typography(BuildContext context) {
  if (Platform.isIOS) {
    return textTheme;
  }
  return Theme.of(context).extension<PlaceboTypography>() ?? textTheme;
}

const primary = MaterialColor(
  0xFF4666F6,
  <int, Color>{
    50: Color(0xFFEDF0FE),
    100: Color(0xFFDAE0FD),
    200: Color(0xFFB5C2FB),
    300: Color(0xFF90A3FA),
    400: Color(0xFF6B85F8),
    500: Color(0xFF4666F6),
    600: Color(0xFF3852C5),
    700: Color(0xFF2A3D94),
    800: Color(0xFF1C2962),
    900: Color(0xFF0E1431),
  },
);

final ThemeData themeData = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primary, backgroundColor: Colors.white),
  primaryColor: primary.shade500,
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  typography: Typography.material2021(),
  tabBarTheme: TabBarTheme(
    labelStyle: textTheme.body.copyWith(fontWeight: FontWeight.bold),
    unselectedLabelStyle: textTheme.body,
  ),
  inputDecorationTheme: InputDecorationTheme(
    helperStyle: textTheme.smallBody.copyWith(color: const Color(0xFF64748B)),
    hintStyle: textTheme.smallBody.copyWith(color: const Color(0xFF64748B)),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFCE3E3E), // critical.500
        width: 2,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFCE3E3E), // critical.500
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    // This will be applied to the "back" icon
    iconTheme: const IconThemeData(color: Colors.black),
    // This will be applied to the action icon buttons that locates on the right side
    actionsIconTheme: const IconThemeData(color: Colors.black),
    centerTitle: false,
    elevation: 1,
    titleTextStyle: textTheme.title2,
  ),
  textTheme: const TextTheme(
    // largeTitle ()
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 34,
      letterSpacing: -0.68,
      fontWeight: FontWeight.w700,
    ),

    // title1 ()
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.56,
    ),

    // title2 ()
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.44,
    ),

    // title3 ()
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
    ),

    // subtitle1 ()
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.34,
    ),

    // subtitle2 ()
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.34,
    ),

    // largeBody ()
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.36,
    ),

    // body ()
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      // letterSpacing: "-0.4px",
    ),

    // smallBody ()
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      // letterSpacing: "-0.4px",
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: textTheme.body,
      backgroundColor: primary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(extendedTextStyle: textTheme.body),
);

final ThemeData darkThemeData = ThemeData(
  // backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color(0xFF4666F6),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    // This will be applied to the "back" icon
    iconTheme: IconThemeData(color: Colors.white),
    // This will be applied to the action icon buttons that locates on the right side
    actionsIconTheme: IconThemeData(color: Colors.blue),
    centerTitle: false,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.lightBlueAccent),
  ),
  // colorScheme: ColorScheme(background: Colors.black),
);
