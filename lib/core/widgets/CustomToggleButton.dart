import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final int pages;
  final Function(int) onCountPressed;
  final int currentIndex;
  const CustomToggleButton(
      {super.key,
      required this.pages,
      required this.onCountPressed,
      required this.currentIndex});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  final scrollController = ScrollController();

  @override
  void initState() {
    centerSelectedChip(widget.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.pages, (index) {
          final isSelected = widget.currentIndex == index;
          return RawChip(
              checkmarkColor: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.onBackground,
              color: MaterialStateProperty.all(isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.05)),
              selected: isSelected,
              onPressed: () => widget.onCountPressed(index),
              label: Text(
                index.toString(),
                style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.onBackground),
              ));
        }),
      ),
    );
  }

  void centerSelectedChip(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final double screenWidth = renderBox.size.width;
      const double selectedChipWidth =
          50; // Adjust this according to your chip width
      final double selectedChipPosition =
          selectedChipWidth * index + (selectedChipWidth / 2);
      final double scrollTo = selectedChipPosition - (screenWidth / 2);
      scrollController.animateTo(scrollTo,
          duration: const Duration(milliseconds: 700), curve: Curves.linear);
    });
  }
}
