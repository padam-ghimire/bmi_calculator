

import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/resusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 const double bottomHeight=80;
 const Color conatinerColor=Color(0xFF13B9FD);
 const Color femaleActiveColor=Colors.pink;
 const Color femaleInActiveColor=Colors.pinkAccent;
 const Color inActiveConatinerColor=Color(0xFF0896ce);

enum Gender{
  male,female
}


//  const Color inActiveconatinerColor=Colors.pink;
 const Color bottomContainerColor= Colors.pink;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


Gender selectedGender;

  // Color maleCardColor = inActiveConatinerColor;
  // Color femaleCardColor = femaleInActiveColor;

  // void updateColor(Gender gender){
  //   if(gender== Gender.male){
  //      if(maleCardColor == inActiveConatinerColor){
  //        maleCardColor= conatinerColor;
  //        femaleCardColor = femaleInActiveColor;
  //      }else{
  //         maleCardColor= inActiveConatinerColor;
  //      }
  //   }else if(gender== Gender.female){
  //     if(femaleCardColor == femaleInActiveColor){
  //        femaleCardColor= femaleActiveColor;
  //        maleCardColor= inActiveConatinerColor;
         
  //      }else{
  //        femaleCardColor= femaleInActiveColor;
         
  //      }

  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(child: 
               GestureDetector(
                 onTap: (){
                   setState(() {
                    selectedGender = Gender.male;
                    print(conatinerColor);
                   });
                 },
                 child: ReusableCard(colour:selectedGender==Gender.male ? inActiveConatinerColor : conatinerColor ,
                 cardChild: IconContent(FontAwesomeIcons.mars,"Male"),
                 ),
               ),  
         ),
         Expanded(child: 
          GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = Gender.female;
              });
            },
              child: ReusableCard(colour:selectedGender==Gender.female ? femaleActiveColor : femaleInActiveColor,
              cardChild: IconContent(FontAwesomeIcons.venus,"Female"),
            ),
          ), 
           
         ),
          ],),
         Expanded(child: 
         ReusableCard(colour:conatinerColor),  
         ),
            Row(children: <Widget>[
            Expanded(child: 
             ReusableCard(colour:conatinerColor),  
         ),
         Expanded(child: 
          ReusableCard(colour:conatinerColor),  
         ),
          ],
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            height: bottomHeight,
            decoration: BoxDecoration(
            color:bottomContainerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
          ),
 
        ],
      ),
      

    );
  }
}

