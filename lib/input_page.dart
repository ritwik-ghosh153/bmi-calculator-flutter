import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour= Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender{Male, Female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour=inactiveCardColour;
  Color femaleCardColour=inactiveCardColour;

  void updateColour(Gender gender){
    if(gender==Gender.Male)
      if(maleCardColour==inactiveCardColour && femaleCardColour==inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour=inactiveCardColour;
      }
      else if(maleCardColour==activeCardColour && femaleCardColour==inactiveCardColour) {
        maleCardColour = inactiveCardColour;
        femaleCardColour=inactiveCardColour;
      }
      else if(maleCardColour==inactiveCardColour && femaleCardColour==activeCardColour){
        femaleCardColour = inactiveCardColour;
        maleCardColour=activeCardColour;
      }
      if(gender==Gender.Female)
        if(maleCardColour==inactiveCardColour && femaleCardColour==inactiveCardColour) {
          femaleCardColour = activeCardColour;
          maleCardColour=inactiveCardColour;
        }
        else if(maleCardColour==inactiveCardColour && femaleCardColour==activeCardColour) {
          femaleCardColour = inactiveCardColour;
          maleCardColour=inactiveCardColour;
        }
        else if(maleCardColour==activeCardColour && femaleCardColour==inactiveCardColour){
          femaleCardColour = activeCardColour;
          maleCardColour=inactiveCardColour;
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
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.Male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconChild(
                        sex: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.Female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild:
                          IconChild(sex: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 10.0,
            ),
          )
        ],
      ),
    );
  }
}
