import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monstersmoke/PlatformBuilder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const PlatformBuilder())));
    });

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth > 400 ? false : true;

        return Center(
          child: Image(
              width: isMobile ? 200 : 500,
              height: 200,
              image: const AssetImage('images/monsterimage.jpg')),
        );
      }),
    );
  }
}
