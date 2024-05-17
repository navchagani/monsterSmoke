import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/GetPagesbloc/get_pages_bloc.dart';

class HTMLViewer extends StatefulWidget {
  final String? htmlContent, title;

  const HTMLViewer({super.key, this.htmlContent, this.title});

  @override
  State<HTMLViewer> createState() => _HTMLViewerState();
}

class _HTMLViewerState extends State<HTMLViewer> {
  final pagesBloc = getIt<GetPagesBloc>();

  @override
  void initState() {
    pagesBloc.add(GetPageEvent(widget.title.toString()));
    super.initState();
  }

  @override
  void dispose() {
    pagesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: pagesBloc,
          child: BlocBuilder<GetPagesBloc, GetPagesState>(
            bloc: pagesBloc,
            builder: (context, pageState) {
              if (pageState is GetPagesLoadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (pageState is GetPagesCompletedState) {
                final document = htmlParser.parse(pageState.htmlModel.body);
                return Material(
                  // elevation: 20.0,
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).colorScheme.background,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: document.body!.children.map((element) {
                        if (element.localName == 'p') {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              element.text,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          );
                        }
                        // Handle other HTML elements as needed
                        return Container();
                      }).toList(),
                    ),
                  ),
                );
              }

              if (pageState is GetPagesErrorState) {
                return Center(child: Text(pageState.error.message.toString()));
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
