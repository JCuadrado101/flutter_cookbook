import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter2/variable_playground.dart';
import 'chapter2/string_playground.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // variablePlayground();
    stringPlayground();
    return Container();
  }
}
