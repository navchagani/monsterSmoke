import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'placeorder_event.dart';
part 'placeorder_state.dart';

class PlaceorderBloc extends Bloc<PlaceorderEvent, PlaceorderState> {
  PlaceorderBloc() : super(PlaceorderInitial()) {
    on<PlaceorderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
