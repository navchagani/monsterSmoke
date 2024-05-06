import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';

class CustomSlider extends StatefulWidget {
  final List<String> images;
  const CustomSlider({super.key, required this.images});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final pageController = PageController();
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (pageController.positions.isNotEmpty) {
      if (selectedindex == widget.images.length - 1) {
        selectedindex == 0;

        Future.delayed(const Duration(seconds: 5))
            .then((value) => pageController.jumpToPage(0));
      } else {
        Future.delayed(const Duration(seconds: 5)).then((value) =>
            pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInQuad));
      }
    }

    return BlocBuilder<IsMobile, bool>(
      builder: (context, isMob) {
        return SizedBox(
          height: !isMob ? 180 : 360,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      onPageChanged: onPageChanged,
                      children: List.generate(widget.images.length, (index) {
                        return Image(
                          // height: 350,
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.images[index]),
                        );
                      }),
                    ),
                  )
                ],
              ),
              Decorations.height10,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(widget.images.length, (index) {
                      final isSelected = selectedindex == index;

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isSelected ? 30.0 : 20.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade400,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                        ),
                      );
                    })),
              ),
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
