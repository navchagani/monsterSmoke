import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getassets_event.dart';
part 'getassets_state.dart';

class GetassetsBloc extends Bloc<GetassetsEvent, GetassetsState> {
  GetassetsBloc() : super(GetassetsInitial()) {
    on<GetassetsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
