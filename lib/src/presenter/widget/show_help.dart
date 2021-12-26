import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

void showHelp(
  BuildContext context, {
  required String title,
  required String subTitle,
  bool voltarDuplo = false,
}) {
  showDialog(
    useRootNavigator: false,
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: ColorsConstants.textBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        subTitle,
        textAlign: TextAlign.justify,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (voltarDuplo) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'ENTENDI',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
