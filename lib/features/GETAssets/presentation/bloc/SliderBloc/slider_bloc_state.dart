part of 'slider_bloc_bloc.dart';

sealed class SliderBlocState extends Equatable {
  const SliderBlocState();

  @override
  List<Object> get props => [];
}

final class SliderBlocInitial extends SliderBlocState {}

class SliderLoadingSlider extends SliderBlocState {}

class SliderCompletedSlider extends SliderBlocState {
  final List<SliderModel> lisImage;

  const SliderCompletedSlider({required this.lisImage});
}

class SliderCompletedSlider1 extends SliderBlocState {
  final List<SliderModel> lisImage;

  const SliderCompletedSlider1({required this.lisImage});
}

class SliderCompletedSlider2 extends SliderBlocState {
  final List<SliderModel> lisImage;

  const SliderCompletedSlider2({required this.lisImage});
}

class SliderErrorSlider extends SliderBlocState {
  final DioException error;

  const SliderErrorSlider({required this.error});
}
