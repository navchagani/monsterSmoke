import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/products_bloc.dart';

class Registery {
  static List<BlocProvider> initializeBlocs({required BuildContext context}) =>
      [
        BlocProvider<CartBloc>(create: ((context) => getIt())),
        BlocProvider<ProductsBloc>(create: ((context) => getIt())),
        BlocProvider<AuthBloc>(create: ((context) => getIt())),
        BlocProvider<IsMobile>(create: ((context) => getIt())),
        BlocProvider<AuthAction>(create: ((context) => getIt())),
      ];
}
