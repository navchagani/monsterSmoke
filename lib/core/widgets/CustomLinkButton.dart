import 'package:flutter/material.dart';

class CustomLinkButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final EdgeInsets? padding;
  final Color? textColor;
  const CustomLinkButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.padding,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: onTap,
          child: Text(
            text.toString(),
            style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.onSurface,
                decorationStyle: TextDecorationStyle.solid,
                decoration: TextDecoration.underline),
          )),
    );
  }
}
