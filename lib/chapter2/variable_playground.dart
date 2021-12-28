import 'package:flutter/material.dart';

void variablePlayground() {
  basicTypes();
  untypedVariables();
  typeInterpolation();
  immutableVariables();
}

void basicTypes() {
  int four = 4;
  double pi = 3.14;
  num someNumber = 24601;
  bool yes = true;
  bool no = false;
  int? nothing;

  print(four);
  print(pi);
  print(someNumber);
  print(yes);
  print(no);
  print(nothing);
}

void untypedVariables() {
  dynamic something = 14.2;
  print(something.runtimeType);
}

void typeInterpolation() {
  var anInteger = 15;
  var aDouble = 26.6;
  var aBoolean = false;

  print(anInteger.runtimeType);
  print(anInteger);

  print(aDouble.runtimeType);
  print(aDouble);

  print(aBoolean.runtimeType);
  print(aBoolean);
}

void immutableVariables() {
  final int immutableInteger = 5;
  final double immutableDouble = 0.015;

  final interpolatedInteger = 10;
  final interpolatedDouble = 72.8;

  print(interpolatedInteger);
  print(interpolatedDouble);

  const aFullySealedVariable = true;
  print(aFullySealedVariable);
}