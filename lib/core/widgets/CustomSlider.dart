import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderModel> images;
  final Axis? direction;
  final double? borderRadius;
  const CustomSlider(
      {super.key, required this.images, this.direction, this.borderRadius});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late PageController pageController;
  int selectedindex = 0;
  late Timer timer;

  @override
  void initState() {
    pageController = PageController(initialPage: selectedindex);
    // pageController.addListener(_pageListener);
    timer = Timer.periodic(const Duration(seconds: 5), _onTimer);
    super.initState();
  }

  @override
  void dispose() {
    // pageController.removeListener(_pageListener);
    pageController.dispose();
    super.dispose();
  }

  void _onTimer(Timer timer) {
    selectedindex = (selectedindex + 1) % widget.images.length;
    if (pageController.positions.isNotEmpty) {
      pageController.animateToPage(
        selectedindex,
        duration: const Duration(seconds: 2) ~/ 2,
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsMobile, bool>(
      builder: (context, isMob) {
        return SizedBox(
          height: !isMob ? 200 : 360,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: widget.direction ?? Axis.horizontal,
                      controller: pageController,
                      onPageChanged: onPageChanged,
                      itemBuilder: (BuildContext context, int index) {
                        final image =
                            widget.images[index % widget.images.length];

                        return Material(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: widget.borderRadius != null
                              ? BorderRadius.circular(10.0)
                              : null,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(image.imageUrl.toString()),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              // Decorations.height10,
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: List.generate(widget.images.length, (index) {
              //         final isSelected = selectedindex == index;

              //         return Padding(
              //           padding: const EdgeInsets.all(4.0),
              //           child: AnimatedContainer(
              //             duration: const Duration(milliseconds: 300),
              //             width: isSelected ? 30.0 : 20.0,
              //             height: 8.0,
              //             decoration: BoxDecoration(
              //                 color: isSelected
              //                     ? Colors.grey.shade600
              //                     : Colors.grey.shade400,
              //                 borderRadius: const BorderRadius.all(
              //                     Radius.circular(10.0))),
              //           ),
              //         );
              //       })),
              // ),
            ],
          ),
        );
      },
    );
  }

  void onPageChanged(int value) {
    setState(() {
      selectedindex = value;
    });
  }

  // onTapIndex(int value) {
  //   setState(() {
  //     selectedindex = value;
  //   });
  //   pageController.animateTo(selectedindex!.toDouble(),
  //       duration: const Duration(milliseconds: 400), curve: Curves.bounceIn);
  // }
}
