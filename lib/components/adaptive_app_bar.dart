import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);
const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // 0.0 means one physical pixel
  ),
);

class AdaptiveAppBar extends StatelessWidget {
  final CupertinoNavigationBar? cupertinoNavigationBar;
  final AppBar? materialAppBar;
  final Widget? title;
  final Widget? trailing;
  final String? previousPageTitle;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final PreferredSize? bottom;
  final double? elevation;
  final Border? border;

  const AdaptiveAppBar(
      {super.key,
      this.title,
      this.trailing,
      this.automaticallyImplyLeading = true,
      this.cupertinoNavigationBar,
      this.materialAppBar,
      this.previousPageTitle = 'Back',
      this.leading,
      this.bottom,
      this.elevation,
      this.border = _kDefaultNavBarBorder});

  CupertinoNavigationBar getCupertinoBar() {
    return cupertinoNavigationBar ??
        CupertinoNavigationBar(
          border: border,
          previousPageTitle: previousPageTitle,
          transitionBetweenRoutes: false,
          middle: title,
          trailing: trailing,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          padding: const EdgeInsetsDirectional.only(start: 0),
        );
  }

  AppBar getMaterialBar() {
    return materialAppBar ??
        AppBar(
          title: title,
          actions: trailing != null
              ? [
                  Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: trailing!)
                ]
              : null,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          bottom: bottom,
          elevation: elevation,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null &&
        (cupertinoNavigationBar == null || materialAppBar == null)) {
      throw Exception(
          'title cannot be supplied when navigation bars are explicity');
    }

    if (Platform.isIOS) {
      return getCupertinoBar();
    }

    return getMaterialBar();
  }
}
