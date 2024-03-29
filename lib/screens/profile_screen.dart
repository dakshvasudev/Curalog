import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      title: Text(
        'Profile',
        style: typography(context).largeBody,
      ),
      body: Container(),
    );
  }
}
