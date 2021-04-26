import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'buttons.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
  it,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                ),
              ),

              Expanded(

                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                ),
              ),

              Expanded(

                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.it;
                    });
                  },
                  color: selectedGender == Gender.it ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.accessibleIcon, label: 'FLUTTER DEVELOPER'),
                ),
              ),
            ],
          )),

          Expanded(child:ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                style: kLabelTextStyle
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kLabelNumbersTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:  Color(0xFF8D8E98) ,
                    activeTrackColor: kBottomContainerColor,
                    thumbColor: kBottomContainerColor,
                    overlayColor: Color(0x298A2BE2),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 27.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                ),
              ],
            ),
          ),),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kLabelNumbersTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                weight++;
                              });
                            },
                        ),
                        SizedBox(width: 10,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),),

              Expanded(child:ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kLabelNumbersTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
            ],
          )),
          BottomButton(
            buttonText: 'CALCULATE',
            onPress: (){

              CalculatorBrain calc =
              CalculatorBrain(
                height: height,
                weight: weight,
                gender: selectedGender,
              );
              calc.getGender();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResults: calc.calculateBMI(),
                resultText: calc.getResult(),
                description: calc.getDescription(),
                colors: calc.getColor(),
              ) ));
            },
          ),
        ],
      ),
    );
  }
}



