import "package:flutter/material.dart";

// ignore: must_be_immutable
class MyTextBoxEditable extends StatelessWidget {
  final String? text;
  final String sectionName;
  void Function()? onPressed;

  MyTextBoxEditable(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 15, bottom: 15),
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
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.inversePrimary))
            ]),
            Text(text!)
          ],
        ));
  }
}
