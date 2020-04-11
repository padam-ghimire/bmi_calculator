import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {


ResultsPage(this.bmiResult,this.resultText,this.interpret);

  final String bmiResult;
  final String resultText;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Indicator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: 
            Container(
              alignment: Alignment.bottomCenter,
              child: Text("Your result", style: kTitleTextStyle,),
            )
          ),
          Expanded(
            flex:10,
            child:ReusableCard(colour: conatinerColor,
            
              cardChild: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(bmiResult,style:kResultTextStlye),
               Text(resultText,style: kBMIResultTextStyle,),
               Text(interpret,textAlign:TextAlign.center,style:kBodyText),

             ],

              ),
            ),
          ),
               BottomButton('RE-CALCULATE',
                (){
            Navigator.pop(context);

                }
               )
        ],
        
      ),
      
    );
  }
}