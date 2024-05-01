import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ['Smoke', 'Vape', 'Hookah', 'Dispensary', 'AdultNovelty'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: Hero(
            tag: 'search',
            child: SizedBox(
              width: 500,
              child: CustomInputField(
                icon: Icon(Icons.search),
                labelText: 'Search Products',
                hintText: 'Search Products',
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    list.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: RawChip(
                            elevation: 5.0,
                            side: BorderSide.none,
                            shadowColor: Colors.black,
                            label: Text(list[index]),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.transparent,
                          ),
                        )).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
