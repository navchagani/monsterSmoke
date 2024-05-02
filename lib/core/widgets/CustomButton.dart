import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double? elevation, radius;
  final Color? backgroundColor, textColor;
  final IconData? iconData;
  final bool? isLoading, enabled, isBordered;

  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.elevation,
      this.backgroundColor,
      this.textColor,
      this.radius,
      this.iconData,
      this.isLoading,
      this.enabled,
      this.isBordered});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isBordered ?? false
          ? 0.0
          : enabled ?? false
              ? 10.0
              : elevation ?? 0.0,
      borderRadius: radius == null ? BorderRadius.circular(10.0) : null,
      color: isBordered ?? false
          ? Colors.transparent
          : enabled ?? true
              ? backgroundColor ?? Colors.transparent
              : Colors.grey.shade300,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: enabled ?? true ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading ?? false
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : iconData != null
                      ? Icon(iconData)
                      : Container(),
              if (iconData != null) Decorations.width5,
              Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: enabled ?? false
                        ? textColor ?? Colors.black
                        : Colors.black),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
