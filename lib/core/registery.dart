import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignInBloc/sign_in_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignUpBloc/sign_up_bloc_bloc.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/PaymentBloc/payment_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/ShippingBloc/shipping_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/SliderBloc/slider_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/BrandBloc/brand_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/CategoryBloc/category_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';

class Registery {
  static List<BlocProvider> initializeBlocs({required BuildContext context}) =>
      [
        // Asset Blocs
        BlocProvider<SliderBloc>.value(value: getIt<SliderBloc>()),
        BlocProvider<ShippingBloc>(
            create: (context) =>
                getIt<ShippingBloc>()..add(const GetShippingEvent())),
        BlocProvider<PaymentBloc>(
            create: (context) =>
                getIt<PaymentBloc>()..add(const GetPaymentEvent())),
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
        BlocProvider<LocalCartBloc>(create: ((context) => getIt())),

        // CartBlocs
        BlocProvider<CartBloc>.value(value: getIt<CartBloc>()),

        // ProductBlocs
        BlocProvider<ProductBloc>(create: ((context) => getIt())),

        // CustomBlocs
        BlocProvider<IsMobile>(create: ((context) => getIt())),
        BlocProvider<AuthAction>(create: ((context) => getIt())),

        BlocProvider<SelectedAddressBloc>(create: ((context) => getIt())),
        BlocProvider<SelectedPaymentBloc>(create: ((context) => getIt())),
        BlocProvider<SelectedShipmentBloc>(create: ((context) => getIt())),
      ];
}
