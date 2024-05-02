import 'package:get_it/get_it.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/products_bloc.dart';

final getIt = GetIt.instance;

void depInjection() {
  getIt.registerFactory(() => IsMobile());

  getIt.registerFactory(() => AuthAction());
  getIt.registerFactory(() => CartBloc());

  // Auth Apis
  getIt.registerFactory(() => AuthBloc());

  // Product Apis
  getIt.registerFactory(() => ProductsBloc());
}
