import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_creator_screen.dart';
import 'chapter3/basic_screen.dart';
import 'chapter3/immutable_widget.dart';
import 'chapter4/flex_screen.dart';
import 'chapter4/profile_screen.dart';
import 'chapter5/login_screen.dart';
import 'chapter5/stop_watch.dart';
import 'chapter6/lib/master_plan_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlanCreatorScreen();
  }
}
