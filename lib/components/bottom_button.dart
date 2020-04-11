


import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class BottomButton extends StatelessWidget {
  
  BottomButton(this.text,this.onTap);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
        child: Center(child: Text(text, style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold),)),
        margin: EdgeInsets.only(top:10),
        height: bottomHeight,
        decoration: BoxDecoration(
        color:bottomContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
      ),
    );
  }
}
