import 'dart:math';

class CalculatorBrain{

  CalculatorBrain(this.height,this.weight);

int height;
int weight;
double _bmi;

String calculateBMI(){
  _bmi= weight/pow(height/100,2);
  return _bmi.toStringAsFixed(1);
}

String getResults(){
  if(_bmi>=25){
    return "Overweight";
  }else if(_bmi>=18.5){
    return "Normal";
  }else{
    return "Underweight";
  }
}

String getInterpreter(){
  if(_bmi>=25){
    return "Your are to heavy !! Do some exercise.";
  }else if(_bmi>=18.5){
    return "Your weight is normal! Keep it up.";
  }else{
    return "Your weight is lower than the normal body!! Eat more.";
  }
}


}