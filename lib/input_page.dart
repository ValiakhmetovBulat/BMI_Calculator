import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor =  Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Color itsCardColor = inactiveCardColor;

  // 1 = male, 2 = female, 3 = ME
  void updateColor (int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor)
      {
        maleCardColor = activeCardColor;
      }
      else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor)
      {
        femaleCardColor = activeCardColor;
      }
      else {
        femaleCardColor = inactiveCardColor;
      }
    }
    if (gender == 3) {
      if (itsCardColor == inactiveCardColor)
      {
        itsCardColor = activeCardColor;
      }
      else {
        itsCardColor = inactiveCardColor;
      }
    }
  }

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

                child:InkWell(
                  onTap: () {
                    setState(() {
                      updateColor(1);
                    });
                  },

                child: ReusableCard(
                  color: maleCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                ),
              ),),
              Expanded(

                child:InkWell(
                  onTap: () {
                    updateColor(3);
                  },

                  child: ReusableCard(
                  color: itsCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.accessibleIcon, label : 'DEVELOPER'),
              ),
                ),),
              Expanded(

                child:InkWell(
                  onTap: () {
                    updateColor(2);
                  },

                child: ReusableCard(
                    color: femaleCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                ),
              ),),
            ],
          )),

          Expanded(child:ReusableCard(
            color: activeCardColor,
          ),),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                color: activeCardColor,
              ),),
              Expanded(child:ReusableCard(
                color: activeCardColor,
              ),),
            ],
          )),
          Container(
            color:  bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}




