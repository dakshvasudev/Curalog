import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveLoading extends StatelessWidget {
  final Color? color;
  final double size;
  const AdaptiveLoading({Key? key, this.color, this.size = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: CircularProgressIndicator(
            color: color,
          ),
        ),
      );
    }
    return CupertinoActivityIndicator(
      color: color,
    );
  }
}
