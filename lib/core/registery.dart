import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registery {
  static List<BlocProvider> initializeBlocs({required BuildContext context}) =>
      [
        BlocProvider(create: ((context) => LoginBloc())),
      ];
}

class LoginBloc extends Bloc<String, String> {
  LoginBloc() : super('') {
    on<String>((event, emit) => emit(event));
  }
}
