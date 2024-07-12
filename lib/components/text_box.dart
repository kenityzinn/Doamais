import "package:flutter/material.dart";

// ignore: must_be_immutable
class MyTextBox extends StatelessWidget {
  final String? text;
  final String sectionName;

  MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                sectionName,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ]),
            const SizedBox(height: 10),
            Text(text!)
          ],
        ));
  }
}
