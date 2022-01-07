import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter5/login_screen.dart';
import 'package:flutter_cookbook/chapter5/stop_watch.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_provider.dart';

import 'home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const HomePage(),
        routes: {
          LoginScreen.route: (BuildContext context) => const LoginScreen(),
          StopWatch.route: (BuildContext context) => const StopWatch(),
        },
      ),
    );
  }
}
