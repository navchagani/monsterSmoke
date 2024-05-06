import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';

class CustomDialog {
  final BuildContext context;
  String? text;

  CustomDialog({required this.context, this.text});

  void showLoadingDialog({required}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          strokeWidth: 5.0,
                        ),
                        Decorations.height10,
                        Text(text ?? 'loading....')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showErrorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: const Icon(
                  Icons.warning,
                  color: Colors.deepOrange,
                ),
                title: Text(text ?? 'Error Occured'),
              ),
            ),
          );
        });
  }

  void showCompletedDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: Colors.green.shade700,
                ),
                title: Text(text ?? 'Completed Successfuily'),
              ),
            ),
          );
        });
  }
}
