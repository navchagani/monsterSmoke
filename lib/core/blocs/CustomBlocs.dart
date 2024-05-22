import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';

class IsMobile extends Bloc<bool, bool> {
  IsMobile() : super(false) {
    on<bool>((event, emit) => emit(event));
  }
}

class AuthAction extends Bloc<bool, bool> {
  AuthAction() : super(false) {
    on<bool>((event, emit) => emit(event));
  }
}

class SelectedShipmentBloc
    extends Bloc<ShippingAddressModel?, ShippingAddressModel?> {
  SelectedShipmentBloc() : super(null) {
    on<ShippingAddressModel?>((event, emit) => emit(event));
  }
}

class SelectedPaymentBloc extends Bloc<PaymentsModel?, PaymentsModel?> {
  SelectedPaymentBloc() : super(null) {
    on<PaymentsModel?>((event, emit) => emit(event));
  }
}

class SelectedAddressBloc
    extends Bloc<CustomerStoreAddressList?, CustomerStoreAddressList?> {
  SelectedAddressBloc() : super(null) {
    on<CustomerStoreAddressList?>((event, emit) => emit(event));
  }
}

class CustomerCardBloc extends Bloc<CustomerOrderCard?, CustomerOrderCard?> {
  CustomerCardBloc() : super(null) {
    on<CustomerOrderCard?>((event, emit) => emit(event));
  }
}

class DashboardPathBloc extends Bloc<String?, String?> {
  DashboardPathBloc() : super('Dashboard') {
    on<String?>((event, emit) => emit(event));
  }
}
