// ignore_for_file: prefer_const_constructors

import '../components/bottom_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

import '../components/box.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.status,
      required this.result,
      required this.resultText});

  final String status;
  final String result;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'You Result',
              style: kTitleText,
            ),
          )),
          Expanded(
              flex: 5,
              child: Box(
                colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      status,
                      style: kResultText,
                    ),
                    Text(
                      result,
                      style: kBMIText,
                    ),
                    Text(
                      resultText,
                      style: kBodyText,
                    ),
                  ],
                ),
              )),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
