import 'package:bmi_calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.description, @required this.bmiResults, @required this.resultText, this.colors});

  final String bmiResults;
  final String resultText;
  final String description;
  final MaterialAccentColor colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard (
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                      resultText,
                    style: TextStyle(
                      color: colors,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      bmiResults,
                    style: kBMITextStyle,
                      textAlign: TextAlign.center
                  ),
                  Text(
                      description,
                    style: kTextStyle,
                      textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonText: 'RE-CALCULATE',
              onPress: (){
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}