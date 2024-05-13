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
import 'package:monstersmoke/features/Cart/data/datasources/cartsApi.dart';
import 'package:monstersmoke/features/Cart/data/repositories/CartRepoImp.dart';
import 'package:monstersmoke/features/Cart/domain/repositories/CartRepo.dart';
import 'package:monstersmoke/features/Cart/domain/usecases/CartUseCase.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/datasources/AssetsApi.dart';
import 'package:monstersmoke/features/GETAssets/data/repositories/AssetsRepoImp.dart';
import 'package:monstersmoke/features/GETAssets/domain/repositories/AssetsRepo.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/PaymentBloc/payment_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/ShippingBloc/shipping_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/SliderBloc/slider_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/datasources/cat&BrandApi.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/repositories/cat&BrandsRepoImp.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/repositories/cat&BrandRepo.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/usecases/cat&BrandUseCase.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/BrandBloc/brand_bloc.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/CategoryBloc/category_bloc.dart';
import 'package:monstersmoke/features/Products/data/datasources/ProductApi.dart';
import 'package:monstersmoke/features/Products/data/repositories/ProductRepoImp.dart';
import 'package:monstersmoke/features/Products/domain/repositories/ProductsRepo.dart';
import 'package:monstersmoke/features/Products/domain/usecases/UseCaseProducts.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

final getIt = GetIt.instance;

void depInjection() {
  getIt.registerSingleton<SharedPrefsApi>(SharedPrefsApi());
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerFactory(() => IsMobile());
  getIt.registerFactory(() => LocalCartBloc());
  getIt.registerFactory(() => AuthAction());

  // Auth Apis
  getIt.registerSingleton<AuthApi>(AuthApi(getIt()));
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImp(authApi: getIt(), sharedPrefsApi: getIt()));
  getIt.registerSingleton<CaseSignIn>(CaseSignIn(repo: getIt()));
  getIt.registerSingleton<CaseSignUp>(CaseSignUp(repo: getIt()));
  getIt.registerSingleton<CaseGetUserData>(CaseGetUserData(repo: getIt()));
  getIt.registerFactory(() => SignInBloc(getIt()));
  getIt.registerFactory(() => SignUpBloc(getIt()));
  getIt.registerFactory(() => CustomerBloc(getIt()));

  // Assets Apis
  getIt.registerSingleton<AssetsApi>(AssetsApi(getIt()));
  getIt.registerSingleton<AssetsRepo>(AssetsRepoImp(assetsApi: getIt()));
  getIt.registerSingleton<CaseGetSliders>(CaseGetSliders(repo: getIt()));
  getIt.registerSingleton<CaseGetCountries>(CaseGetCountries(repo: getIt()));
  getIt.registerSingleton<CaseGetStates>(CaseGetStates(repo: getIt()));
  getIt.registerSingleton<CaseGetShippingAddresses>(
      CaseGetShippingAddresses(repo: getIt()));
  getIt.registerSingleton<CaseGetPayments>(CaseGetPayments(repo: getIt()));
  getIt.registerFactory(() => SliderBloc(getIt()));
  getIt.registerFactory(() => CountryBloc(getIt()));
  getIt.registerFactory(() => StateBloc(getIt()));
  getIt.registerFactory(() => PaymentBloc(getIt()));
  getIt.registerFactory(() => ShippingBloc(getIt()));

  // Cateogry Brands Apis
  getIt.registerSingleton<CatBrandApi>(CatBrandApi(getIt()));
  getIt.registerSingleton<CatBrandRepo>(CatBrandsRepoImp(getIt()));
  getIt.registerSingleton<CaseGetBrands>(CaseGetBrands(repo: getIt()));
  getIt.registerSingleton<CaseGetCategories>(CaseGetCategories(repo: getIt()));
  getIt.registerFactory(() => BrandBloc(getIt()));
  getIt.registerFactory(() => CategoryBloc(getIt()));

  // Product Apis
  getIt.registerSingleton<ProductApi>(ProductApi(getIt()));
  getIt.registerSingleton<ProductsRepo>(ProductRepoImp(productApi: getIt()));
  getIt.registerSingleton<CaseGetProducts>(CaseGetProducts(repo: getIt()));
  getIt.registerSingleton<CaseGetProductDetails>(
      CaseGetProductDetails(repo: getIt()));
  getIt.registerSingleton<CaseSearchProduct>(CaseSearchProduct(repo: getIt()));
  getIt.registerFactory(() => ProductBloc(getIt(), getIt(), getIt()));

  // Cart Apis
  getIt.registerSingleton<CartApi>(CartApi(getIt(), getIt()));
  getIt.registerSingleton<CartRepo>(CartRepoImp(cartApi: getIt()));
  getIt.registerSingleton<CaseGetCart>(CaseGetCart(repo: getIt()));
  getIt.registerSingleton<CaseAddToCart>(CaseAddToCart(repo: getIt()));
  getIt.registerSingleton<CaseUpdateToCart>(CaseUpdateToCart(repo: getIt()));
  getIt
      .registerSingleton<CaseRemoveFromCart>(CaseRemoveFromCart(repo: getIt()));
  getIt.registerFactory(() => CartBloc(getIt(), getIt(), getIt(), getIt()));
}
