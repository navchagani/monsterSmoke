import 'package:flutter/material.dart';
import 'package:monstersmoke/Modes/MobileMode.dart';
import 'package:monstersmoke/Modes/TabMode.dart';

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth > 400 ? false : true;

      if (isMobile) {
        return const MobileViewMode();
      }

      return const TabMode();
    });
  }
}
