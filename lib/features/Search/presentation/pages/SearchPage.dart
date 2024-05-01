import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
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
    );
  }

  Widget body() {
    final list = ['Smoke', 'Vape', 'Hookah', 'Dispensary', 'AdultNovelty'];

    return SingleChildScrollView(
      child: Column(
        children: list
            .map((e) => TreeTile(
                  list: list,
                  text: e,
                ))
            .toList(),
      ),
    );
  }
}

class TreeTile extends StatefulWidget {
  final String text;
  final List<String> list;
  const TreeTile({super.key, required this.text, required this.list});

  @override
  State<TreeTile> createState() => _TreeTileState();
}

class _TreeTileState extends State<TreeTile> {
  bool showSubCat = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: ListTile(
            title: Text(
              widget.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(() {
                showSubCat = !showSubCat;
              });
            },
            dense: true,
            trailing: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
        if (showSubCat)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 300, minHeight: 40),
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 5.0,
                    spacing: 5.0,
                    children: widget.list
                        .map(
                          (e) => RawChip(
                            side: const BorderSide(color: Colors.black12),
                            padding: const EdgeInsets.all(2.0),
                            label: Text(
                              e,
                              style: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {},
                            // dense: true,
                          ),
                        )
                        .toList(),
                  ),
                )

                // ListView(
                //   shrinkWrap: true,
                //   children: widget.list
                //       .map(
                //         (e) => ListTile(
                //           title: Text(
                //             e,
                //             style: const TextStyle(fontSize: 20),
                //           ),
                //           onTap: () {},
                //           dense: true,
                //         ),
                //       )
                //       .toList(),
                // ),
                ),
          )
      ],
    );
  }
}
