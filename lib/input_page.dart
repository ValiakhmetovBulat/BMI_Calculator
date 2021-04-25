import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
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
                      selectedGender = Gender.it;
                      });
                    },
                  color: selectedGender == Gender.it ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.accessibleIcon, label : 'DEVELOPER'),
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
            ],
          )),

          Expanded(child:ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              children: <Widget>[
                Text('Height',
                style: kLabelTextStyle ,),

              ],
            ),
          ),),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                color: kActiveCardColor,
              ),),
              Expanded(child:ReusableCard(
                color: kActiveCardColor,
              ),),
            ],
          )),
          Container(
            color:  kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}