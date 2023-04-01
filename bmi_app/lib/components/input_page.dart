// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, camel_case_types

import 'box.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/constants.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/round_icon_button.dart';
import 'package:bmi_app/calculation.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? gender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: Box(
                    colour: gender == GenderType.male
                        ? kBoxColor
                        : kInactiveBoxColor,
                    onPress: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                    cardChild: CardTemp(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: Box(
                    colour: gender == GenderType.female
                        ? kBoxColor
                        : kInactiveBoxColor,
                    onPress: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    cardChild: CardTemp(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Box(
              colour: kBoxColor,
              onPress: () {
                setState(() {
                  gender = GenderType.female;
                });
              },
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        height.toString(),
                        style: kSilderTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF8D8E98),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: kSliderMin,
                        max: kSliderMax,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: Box(
                      colour: kBoxColor,
                      onPress: () {
                        setState(() {});
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kSilderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: Box(
                      colour: kBoxColor,
                      onPress: () {
                        setState(() {});
                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kSilderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Calulation calc = Calulation(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      result: calc.calculateBMI(),
                      status: calc.getStatus(),
                      resultText: calc.getResultText(),
                    ),
                  ));
            },
            buttonTitle: 'CALCULATE',
          ),
        ]));
  }
}
