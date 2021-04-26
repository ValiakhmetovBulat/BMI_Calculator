import 'dart:math';

import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight, this.gender});

  final int height;
  final int weight;
  final Gender gender;

  double _bmi;
  bool _isNormalGender;

  String calculateBMI(){
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25 && (gender == Gender.male || gender == Gender.female)) {
      return 'Лишний вес';
    }
    else if (_bmi > 18) {
      return 'Нормальный вес';
    }
    else {
      return 'Недостаток веса';
    }
  }

  String getDescription() {
    if (_bmi >= 25 && _isNormalGender) {
      return 'Твой вес превышает норму. Тебе стоит больше упражняться.';
    }
    else if (_bmi > 18  && _isNormalGender) {
      return 'Твой вес находится в норме. Круто!';
    }
    else if (_isNormalGender){
      return 'У тебя недостаток веса. Тебе стоит лучше питаться';
    }
    else if (_bmi >= 25 && !(_isNormalGender)) {
      return 'Наелся скобочек и спит.';
    }
    else if (_bmi > 18 && !(_isNormalGender)) {
      return 'Скобки еще не поработили тебя.';
    }
    else {
      return 'Ты потребляешь слишком мало скобок.';
    }
  }

  void getGender() {
    if (gender == Gender.female || gender == Gender.male) {
      _isNormalGender = true;
    }
    else {
      _isNormalGender = false;
    }
  }

    MaterialAccentColor getColor() {
    if(_bmi >= 25 || _bmi <= 18) {
      return Colors.redAccent;
    }
    else {
      return Colors.greenAccent;
    }
  }

}