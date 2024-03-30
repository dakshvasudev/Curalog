import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      body: Center(
        child: MyButton(
          onTap: () async{
            await FirebaseAuth.instance.signOut();
          },
          txt: 'Sign Out'
        ),
      ),
    );
  }
}