import 'dart:io';

import 'package:curalog/config/theme/placebo_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final String variant;
  final String? label;
  final bool loading;
  final EdgeInsets? padding;
  final bool disabled;
  final bool rounded;
  final Icon? icon;
  final Color? buttonColor;
  final Color? labelColor;

  const Button({
    Key? key,
    this.padding,
    this.rounded = false,
    this.loading = false,
    this.disabled = false,
    required this.onPressed,
    required this.variant,
    this.icon,
    this.label,
    this.buttonColor = primaryColor,
    this.labelColor,
  }) : super(key: key);

  Widget _buildAndroidTextButton(BuildContext context) {
    final text = _buildLabel();
    final loader = _buildLoader(context);

    // Disabled colors are automatically handled in TextButton. That's why not using `_getColor`
    final style = TextButton.styleFrom(foregroundColor: buttonColor);

    // Button with text and icon
    if (label != null && icon != null) {
      return TextButton.icon(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        icon: loading ? loader : icon!,
        label: text,
      );
    }

    // Button with only icon
    if (label == null && icon != null) {
      return TextButton(
          style: style,
          onPressed: (disabled || loading) ? null : onPressed,
          child: loading ? loader : icon!);
    }

    // Button with text
    return TextButton(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        child: loading ? loader : text);
  }

  Widget _buildIosTextButton(BuildContext context) {
    final isDisabled = loading || disabled;
    final color = _getColor(context, isDisabled);

    final text = _buildLabel(TextStyle(color: color));
    final loader = _buildLoader(context);

    // Button with text
    var display = loading ? [loader] : [text];

    // Button with only icon
    if (label == null && icon != null) {
      final styledIcon = Icon(icon!.icon, color: color);
      display = loading ? [loader] : [styledIcon];
    }

    // Button with text and icon
    if (label != null && icon != null) {
      final styledIcon = Icon(icon!.icon, color: color);
      const spacer = SizedBox(width: 8);
      display = loading ? [loader, spacer, text] : [styledIcon, spacer, text];
    }

    return CupertinoButton(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onPressed: (isDisabled) ? null : onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: display,
      ),
    );
  }

  Widget _buildAndroidFilledButton(BuildContext context) {
    final text = _buildLabel();
    final loader = _buildLoader(context);

    // Disabled colors are automatically handled in TextButton. That's why not using `_getColor`
    final style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: buttonColor,
      shape: rounded
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  24.0), // Adjust the value for your preferred border radius
            )
          : null,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );

    // Button with text and icon
    if (label != null && icon != null) {
      return ElevatedButton.icon(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        icon: loading ? loader : icon!,
        label: text,
      );
    }

    // Button with only icon
    if (label == null && icon != null) {
      return ElevatedButton(
          style: style,
          onPressed: (disabled || loading) ? null : onPressed,
          child: loading ? loader : icon!);
    }

    // Button with text
    return ElevatedButton(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        child: loading ? loader : text);
  }

  Widget _buildIosFilledButton(BuildContext context) {
    final isDisabled = loading || disabled;
    final color = _getColor(context, isDisabled);
    final disabledColor = isDisabled ? Theme.of(context).disabledColor : null;

    // iOS has not very good styling of disabled button. So we manually fix it
    final text = Flexible(child: _buildLabel(TextStyle(color: disabledColor)));
    final loader = _buildLoader(context);

    // Button with text
    var display = loading ? [loader] : [text];

    // Button with only icon
    if (label == null && icon != null) {
      final styledIcon = Icon(
        icon!.icon,
        color: disabledColor,
        size: 20,
      );
      display = loading ? [loader] : [styledIcon];
    }

    // Button with text and icon
    if (label != null && icon != null) {
      final styledIcon = Icon(icon!.icon, color: disabledColor);
      const spacer = SizedBox(width: 4);
      display = loading ? [loader, spacer, text] : [styledIcon, spacer, text];
    }

    return CupertinoButton(
      color: color,
      minSize: 0,
      padding: padding ??
          EdgeInsets.symmetric(vertical: rounded ? 14 : 12, horizontal: 16),
      borderRadius:
          rounded ? BorderRadius.circular(26.0) : BorderRadius.circular(4.0),
      onPressed: (isDisabled) ? null : onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: display,
      ),
    );
  }

  Widget _buildAndroidOutlinedButton(BuildContext context) {
    final loader = _buildLoader(context);
    final isDisabled = loading || disabled;
    final color = _getColor(context, isDisabled);
    final text = _buildLabel(TextStyle(color: color));

    // Disabled colors are automatically handled in TextButton. That's why not using `_getColor`
    final style = OutlinedButton.styleFrom(
      elevation: 0,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      side: BorderSide(
        color: color,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      shape: rounded
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            )
          : null,
    );

    // Button with text and icon
    if (label != null && icon != null) {
      return OutlinedButton.icon(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        icon: loading ? loader : icon!,
        label: text,
      );
    }

    // Button with only icon
    if (label == null && icon != null) {
      return OutlinedButton(
        style: style,
        onPressed: (disabled || loading) ? null : onPressed,
        child: loading ? loader : icon!,
      );
    }

    // Button with text
    return OutlinedButton(
      style: style,
      onPressed: (disabled || loading) ? null : onPressed,
      child: loading ? loader : text,
    );
  }

  Widget _buildIosOutlinedButton(BuildContext context) {
    final isDisabled = loading || disabled;
    final color = _getColor(context, isDisabled);
    final disabledColor = isDisabled ? Theme.of(context).disabledColor : null;

    // iOS has not very good styling of disabled button. So we manually fix it
    final text = Flexible(child: _buildLabel(TextStyle(color: color)));
    final loader = _buildLoader(context);

    // Button with text
    var display = loading ? [loader] : [text];

    // Button with only icon
    if (label == null && icon != null) {
      final styledIcon = Icon(
        icon!.icon,
        color: disabledColor,
      );
      display = loading ? [loader] : [styledIcon];
    }

    // Button with text and icon
    if (label != null && icon != null) {
      final styledIcon = Icon(
        icon!.icon,
        color: disabledColor,
      );
      const spacer = SizedBox(width: 4);
      display = loading ? [loader, spacer, text] : [styledIcon, spacer, text];
    }

    return Container(
      decoration: rounded
          ? BoxDecoration(
              border: Border.all(color: color, width: 1),
              borderRadius: BorderRadius.circular(24),
            )
          : BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(8)),
      child: CupertinoButton(
        minSize: 0,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        onPressed: (isDisabled) ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: display,
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).disabledColor,
            ),
    );
  }

  Text _buildLabel([TextStyle? overrideStyle]) {
    assert(!(label == null && icon == null),
        'Label and icon cannot both be empty');

    final style = (const TextStyle(fontSize: 15))
        .merge(overrideStyle)
        .copyWith(color: labelColor);
    if (label != null) return Text(label!, style: style);

    return Text(
      '',
      style: style,
    );
  }

  Color _getColor(BuildContext context, bool isDisabled) {
    return isDisabled ? Theme.of(context).disabledColor : buttonColor!;
  }

  @override
  Widget build(BuildContext context) {
    if (variant == 'text') {
      if (Platform.isIOS) {
        return _buildIosTextButton(context);
      }

      return _buildAndroidTextButton(context);
    }

    if (variant == 'outlined') {
      if (Platform.isIOS) {
        return _buildIosOutlinedButton(context);
      }

      return _buildAndroidOutlinedButton(context);
    }

    if (variant == 'filled') {
      if (Platform.isIOS) {
        return _buildIosFilledButton(context);
      }
      return _buildAndroidFilledButton(context);
    }

    return const Text('Variant not handled');
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String txt;

  const MyButton({
    super.key,
    required this.onTap,
    required this.txt
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
