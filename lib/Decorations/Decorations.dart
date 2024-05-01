import 'package:flutter/material.dart';

class Decorations {
  static Widget get height15 => const SizedBox(height: 15);
  static Widget get height10 => const SizedBox(height: 10);
  static Widget get height5 => const SizedBox(height: 5);
  static Widget get width15 => const SizedBox(width: 15);
  static Widget get width10 => const SizedBox(width: 10);
  static Widget get width8 => const SizedBox(width: 8);
  static Widget get width5 => const SizedBox(width: 5);

  static TextStyle get headingBig => const TextStyle(
      fontSize: 22, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);

  static TextStyle get heading => const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal);

  static TextStyle get body => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal);

  static TextStyle get caption => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic);

  static get boxDecoration => BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      );

  static get boxShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      );

  static get containerPadding =>
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0);

  static Widget contain({required Widget child}) => Container(
        decoration: boxDecoration,
        padding: containerPadding,
        child: child,
      );

  static InputDecoration inputDecoration(
          {required String hint, bool? noFill, Widget? icon}) =>
      InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: noFill ?? true ? true : false,
        fillColor: Colors.grey.shade100,
        focusColor: Colors.grey.shade100,
        // counterText: hint,
        suffixIcon: icon,
        suffixStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
        hintText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      );

  static Material customMaterial({required Widget child}) => Material(
        color: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.grey.shade500)),
        child: child,
      );
}