import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignInBloc/sign_in_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignUpBloc/sign_up_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/SliderBloc/slider_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/BrandBloc/brand_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/CategoryBloc/category_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/products_bloc.dart';

class Registery {
  static List<BlocProvider> initializeBlocs({required BuildContext context}) =>
      [
        // Asset Blocs
        BlocProvider<SliderBloc>.value(value: getIt<SliderBloc>()),
        BlocProvider<CountryBloc>(
            create: ((context) => getIt()..add(const GetCountryEvent()))),
        BlocProvider<StateBloc>(create: ((context) => getIt())),

        // Auth Blocs
        BlocProvider<SignInBloc>(create: ((context) => getIt())),
        BlocProvider<SignUpBloc>(create: ((context) => getIt())),

        // Category Brand Blocs
        BlocProvider<CategoryBloc>.value(
            value: getIt<CategoryBloc>()..add(const GetCategoryEvent('1'))),
        BlocProvider<BrandBloc>.value(value: getIt<BrandBloc>()),

        // CustomerBlocs
        BlocProvider<CustomerBloc>(create: ((context) => getIt())),

        // CartBlocs
        BlocProvider<CartBloc>.value(value: getIt<CartBloc>()),

        // ProductBlocs
        BlocProvider<ProductsBloc>(create: ((context) => getIt())),

        // CustomBlocs
        BlocProvider<IsMobile>(create: ((context) => getIt())),
        BlocProvider<AuthAction>(create: ((context) => getIt())),
      ];
}
