import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Auth/data/datasources/AuthApi.dart';
import 'package:monstersmoke/features/Auth/data/repositories/AuthRepoImp.dart';
import 'package:monstersmoke/features/Auth/domain/repositories/AuthRepo.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignInBloc/sign_in_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignUpBloc/sign_up_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/products_bloc.dart';

final getIt = GetIt.instance;

void depInjection() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerFactory(() => IsMobile());

  getIt.registerFactory(() => AuthAction());
  getIt.registerFactory(() => CartBloc());

  // Auth Apis
  getIt.registerSingleton<AuthApi>(AuthApi(getIt()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(authApi: getIt()));
  getIt.registerSingleton<CaseSignIn>(CaseSignIn(repo: getIt()));
  getIt.registerSingleton<CaseSignUp>(CaseSignUp(repo: getIt()));
  getIt.registerSingleton<CaseGetUserData>(CaseGetUserData(repo: getIt()));
  getIt.registerFactory(() => SignInBloc(getIt()));
  getIt.registerFactory(() => SignUpBloc(getIt()));
  getIt.registerFactory(() => CustomerBloc(getIt()));

  // Product Apis
  getIt.registerFactory(() => ProductsBloc());
}
