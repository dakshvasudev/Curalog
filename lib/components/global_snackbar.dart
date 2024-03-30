import 'package:curalog/config/theme/theme.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
  warning,
}

class GlobalSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    bool isFloating = true,
  }) {
    if (message.isEmpty) {
      return;
    }

    if (!context.mounted) return;

    final snackBar = isFloating
        ? _buildFloatingSnackBar(message, type, context)
        : _buildTopSnackBar(message, type, context);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static SnackBar _buildTopSnackBar(
      String message, SnackBarType type, BuildContext context) {
    Color backgroundColor;
    IconData icon;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = colors(context).success.s500;
        icon = Icons.check;
        break;
      case SnackBarType.error:
        backgroundColor = colors(context).critical.s500;
        icon = Icons.error_outline;
        break;
      case SnackBarType.info:
        backgroundColor = colors(context).primary.s500;
        icon = Icons.info_outline;
        break;
      case SnackBarType.warning:
        backgroundColor = colors(context).warning.s600;
        icon = Icons.warning;
        break;
    }

    return SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            child: const Text(
              'Dismiss',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _dismissSnackBar(context),
          ),
        ],
      ),
    );
  }

  static SnackBar _buildFloatingSnackBar(
      String message, SnackBarType type, BuildContext context) {
    Color backgroundColor;
    IconData icon;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = colors(context).success.s500;
        icon = Icons.check;
        break;
      case SnackBarType.error:
        backgroundColor = colors(context).critical.s500;
        icon = Icons.error_outline;
        break;
      case SnackBarType.info:
        backgroundColor = colors(context).primary.s500;
        icon = Icons.info_outline;
        break;
      case SnackBarType.warning:
        backgroundColor = colors(context).warning.s600;
        icon = Icons.warning;
        break;
    }

    return SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static void _dismissSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
