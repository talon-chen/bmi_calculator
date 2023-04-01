import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.icon, required this.action});

  final IconData? icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: action,
      child: Icon(icon),
    );
  }
}
