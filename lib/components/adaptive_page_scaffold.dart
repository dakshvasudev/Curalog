import 'dart:io';

import 'package:curalog/components/adaptive_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptivePageScaffold extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final AdaptiveAppBar? appBar;
  final bool cupertinoSafeAreaBottom;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool automaticallyImplyLeading;
  final String? previousPageTitle;
  final Widget? floatingActionButton;
  final Color? appBarColor;
  final IconThemeData? appBarIconTheme;

  const AdaptivePageScaffold({
    this.cupertinoSafeAreaBottom = false,
    this.appBar,
    this.title,
    this.appBarColor,
    this.appBarIconTheme,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.automaticallyImplyLeading = true,
    this.floatingActionButton,
    this.previousPageTitle = 'Back',
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(appBar == null || title == null,
        'appBar and title cannot be specified together');

    if (Platform.isIOS) {
      return Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: CupertinoPageScaffold(
          navigationBar: appBar?.getCupertinoBar() ??
              CupertinoNavigationBar(
                middle: title,
                backgroundColor: appBarColor,
                transitionBetweenRoutes: false,
                automaticallyImplyLeading: automaticallyImplyLeading,
                previousPageTitle: previousPageTitle,
              ),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
          child: SafeArea(
            bottom: cupertinoSafeAreaBottom,
            child: body,
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      appBar: appBar?.getMaterialBar() ??
          AppBar(
            automaticallyImplyLeading: automaticallyImplyLeading,
            title: title,
            backgroundColor: appBarColor,
            iconTheme: appBarIconTheme,
          ),
      body: body,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
