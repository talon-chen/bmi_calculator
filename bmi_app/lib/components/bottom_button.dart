import 'package:flutter/material.dart';
import '/constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBoxColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            buttonTitle,
            style: kSubmitButtonText,
          ),
        ),
      ),
    );
  }
}
