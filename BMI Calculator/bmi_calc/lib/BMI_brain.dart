import 'package:flutter/material.dart';

class BMIbrain{
  BMIbrain(this.height,this.weight);
  int height;
  int weight;

  String _resultStr = "Normal";
  Color _color = Colors.white;
  double _bmi = 45.7;
  double _lspace = 2;
  FontWeight _fweight = FontWeight.w500;
  String _message = "Your BMI is very less you should eat more";

  String getBMI(){
    _bmi=(weight/((height/100)*(height/100)));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
     return this._resultStr="Overweight";
    }
    else if(_bmi>18.5){
      return _resultStr="Normal";
    }
    else{
      return _resultStr="UnderWeight";
    }
  }

Color font(){
  if(_bmi>=25){
      return this._color=Colors.red;
    }
    else if(_bmi>18.5){
      return _color=Colors.green;
    }
    else{
      return _color=Colors.yellow;
     }
  } 

double lspacer(){
    if(_bmi>=25){
    return this._lspace=4;
    }
    else if(_bmi>18.5){
     return _lspace=1;
     }
    else{
    return  _lspace=-2;
  }
  }
FontWeight fontWeighter(){
  if(_bmi>=25){
    return this._fweight=FontWeight.w900;
    }
    else if(_bmi>18.5){
      return _fweight=FontWeight.w500;
    }
    else{
     return _fweight=FontWeight.w300;
    }
}

String messages(){
  if(_bmi>=25){
      return this._message="You have a higher than normal body weight. Try to exercise more.";
    }
    else if(_bmi>18.5){
      return _message="You have a normal body weight. Good job!";
    }
    else{
      return _message="Your BMI is very less you should eat more";
    }
}
}