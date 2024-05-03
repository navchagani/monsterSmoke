import 'package:dio/dio.dart';

abstract class DataStates<T> {
  final T? data;
  final DioException? error;

  DataStates({this.data, this.error});
}

class SuccessState<T> extends DataStates<T> {
  SuccessState({super.data});
}

class ErrorState<T> extends DataStates<T> {
  final DioException dioException;

  ErrorState({required this.dioException}) : super(error: dioException);
}
