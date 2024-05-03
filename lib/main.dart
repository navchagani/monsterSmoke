import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Splash.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/registery.dart';
import 'package:monstersmoke/features/Theme/LightTheme.dart';

void main() {
  depInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Registery.initializeBlocs(context: context),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: MonsterThemes.themeLight,
        home: const SplashScreen(),
      ),
    );
  }
}
