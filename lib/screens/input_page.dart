

import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,female
}


//  const Color inActiveconatinerColor=Colors.pink;
 const Color bottomContainerColor= Colors.pink;
int height=180;
int weight= 20;
int age = 10;
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
        title: Text('BODY MASS INDICATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(child: 
               ReusableCard(
                 onPress: (){
                    setState(() {
                      selectedGender= Gender.male;
                    });
                 },
              colour:selectedGender==Gender.male ? inActiveConatinerColor : conatinerColor ,
               cardChild: IconContent(FontAwesomeIcons.mars,"Male"),
               ),  
         ),
         Expanded(child: 
          ReusableCard(
            onPress: (){
              setState(() {
                selectedGender = Gender.female;
              });
            },
            colour:selectedGender==Gender.female ? femaleActiveColor : femaleInActiveColor,
             cardChild: IconContent(FontAwesomeIcons.venus,"Female"),
            ), 
           
         ),
          ],),
         Expanded(child: 
         ReusableCard(colour:conatinerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT",style: kCardTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumTextStyle,),
                      Text("cm", style: kCardTextStyle,)
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius:30),
                      ),
                      child: Slider(
                      value: height.toDouble(),
                      inactiveColor: Color(0xFF8D8E99),
                      min:120,
                      max: 220,
                       onChanged: (double changedValue){

                         setState(() {
                         height= changedValue.round();
                           
                         });
                       },

                    
                    ),
                  )
                  
                ],
                
              ),
         ),  
         ),
            Row(children: <Widget>[
            Expanded(child: 
             ReusableCard(
               colour:conatinerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("WEIGHT",style:kCardTextStyle),
                    Text(weight.toString(),style: kNumTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoudnButton(
                        icon:FontAwesomeIcons.minus,
                        pressed:(){
                          setState(() {
                            weight--;
                          });
                        }

                      
                        
                        ),
                          // child: Icon(Icons.add,color:Colors.white),
                        
                        SizedBox(width:10),
                        RoudnButton(icon:FontAwesomeIcons.plus,
                          pressed:(){
                           setState(() {
                             weight++;
                           });
                          }
                        ),
                        
                      ],
                    ),

                    
                  ]
                ),
               ),  
         ),
         Expanded(child: 
          ReusableCard(colour:conatinerColor,
            cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Age",style:kCardTextStyle),
                    Text(age.toString(),style: kNumTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoudnButton(
                        icon:FontAwesomeIcons.minus,
                        pressed:(){
                          setState(() {
                            age--;
                          });
                        }

                      
                        
                        ),
                          // child: Icon(Icons.add,color:Colors.white),
                        
                        SizedBox(width:10),
                        RoudnButton(icon:FontAwesomeIcons.plus,
                          pressed:(){
                           setState(() {
                             age++;
                           });
                          }
                        ),
                        
                      ],
                    ),

                    
                  ]
                ),

          
          ),  
         ),
          ],
          ),
          BottomButton('CALCULATE',(){
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(calc.calculateBMI(),calc.getResults(),calc.getInterpreter())));
          }),
 
        ],
      ),
      

    );
  }
}

class RoudnButton extends StatelessWidget {

  RoudnButton({this.icon,this.pressed});
  final IconData icon;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:pressed,
    
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height:56,
        width:56,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E) ,
    );
  }
}

