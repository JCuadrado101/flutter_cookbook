import 'package:flutter/material.dart';
import 'chapter3/basic_screen.dart';
import 'chapter3/immutable_widget.dart';
import 'chapter4/flex_screen.dart';
import 'chapter4/profile_screen.dart';
import 'chapter5/stop_watch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StopWatch();
  }
}
