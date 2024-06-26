import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomSlider.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/SliderBloc/slider_bloc_bloc.dart';

class SliverBar1 extends StatefulWidget {
  final int? siderId, buissnessId;
  final Axis? axis;
  const SliverBar1({super.key, this.siderId, this.buissnessId, this.axis});

  @override
  State<SliverBar1> createState() => _SliverBar1State();
}

class _SliverBar1State extends State<SliverBar1> {
  SliderBloc bloc = getIt<SliderBloc>();

  @override
  void initState() {
    bloc.add(GetSliderEvent(
        sliderId: '${widget.siderId ?? 86}',
        buissnessId: '${widget.buissnessId ?? 1}'));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocBuilder<SliderBloc, SliderBlocState>(
          builder: (context, sliderState) {
            if (sliderState is SliderLoadingSlider) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (sliderState is SliderCompletedSlider) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomSlider(
                  borderRadius: 15.0,
                  images: sliderState.lisImage,
                  direction: widget.axis ?? Axis.horizontal,
                ),
              );
            }

            if (sliderState is SliderErrorSlider) {
              return const Center(
                child: Text('Unable to load image'),
              );
            }

            return Container(
              color: const Color.fromARGB(255, 241, 239, 239),
            );
          },
        ));
  }
}
