import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/PlatformBuilder.dart';
import 'package:monstersmoke/core/platform.dart';
import 'package:monstersmoke/core/registery.dart';

void main() {
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
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const PlatformBuilder(),
      ),
    );
  }
}
