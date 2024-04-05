import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/components/async_builder.dart';
import 'package:curalog/components/button.dart';
import 'package:curalog/components/global_snackbar.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();  
    } catch (e) {
      GlobalSnackBar.show(context,
          message: e.toString(), type: SnackBarType.error);
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      title: Text(
        'Profile',
        style: typography(context).largeBody,
      ),

      //sign out
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AsyncBuilder(
            future: _signOut,
            builder: (onPressed, loading) => Button(
              onPressed: onPressed,
              loading: loading,
              label: 'Sign Out',
              variant: 'filled',
            ),
          ),
        ),
      ),
    );
  }
}
