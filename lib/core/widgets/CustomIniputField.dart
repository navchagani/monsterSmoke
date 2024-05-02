import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';

class CustomInputField extends StatelessWidget {
  final Widget? icon;
  final String labelText;
  final bool? toHide, enabled, noFill;
  final String hintText;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final int? maxLines;
  final TextInputType? inputType;
  final Function()? onTap;
  final double? elevation;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.toHide,
    this.onChanged,
    this.maxLines,
    this.inputType,
    this.enabled,
    this.noFill,
    this.icon,
    this.onTap,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: elevation ?? 0.0,
      borderRadius: BorderRadiusDirectional.circular(10.0),
      child: TextFormField(
          onTap: onTap,
          enabled: enabled ?? true,
          controller: controller,
          obscureText: toHide ?? false,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          keyboardType: inputType ?? TextInputType.text,
          decoration: Decorations.inputDecoration(hint: hintText, icon: icon)),
    );
  }
}
