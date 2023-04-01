import 'package:flutter/material.dart';
import '/constants.dart';

class CardTemp extends StatelessWidget {
  final IconData icon;
  final String label;

  const CardTemp(
      {super.key,
      // required this.color,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 60,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        label,
        style: kLabelTextStyle,
      )
    ]);
  }
}
