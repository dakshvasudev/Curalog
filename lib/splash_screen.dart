import 'dart:async';
import 'package:curalog/config/constants.dart';
import 'package:curalog/main.dart';
import 'package:curalog/screens/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      // if (firebaseAuth.currentUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (c) => MyHomePage()));
      // }
      // else {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (c) => const GetStartedScreen()));
      // }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.medical_information,
            color: Colors.white,
            size: 110,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'AMIGO',
            style: GoogleFonts.francoisOne(fontSize: 55, color: Colors.white),
          ),
        ],
      ),
    ));
  }
}
