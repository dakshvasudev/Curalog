import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/components/button.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void signUserUp() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      title: Text(
        'Profile',
        style: typography(context).largeBody,
      ),
      
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
          child: Button(
            onPressed: signUserUp,
            label: 'Sign Out',
            variant: 'filled',
          ),
      ),

      

      
    );
  }
}
