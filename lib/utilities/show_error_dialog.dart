import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog<void>(
      context: context,
      builder: ((context) {
        // ignore: prefer_const_constructors
        return AlertDialog(
          title: const Text('An Error Occured'),
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK")),
          ],
        );
      }
    )
  );
}