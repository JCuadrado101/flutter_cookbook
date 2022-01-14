import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int? appCounter;

  @override
  initState() {
    super.initState();
    _incrementCounter();
  }

  Future _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    appCounter = prefs.getInt('appCounter') ?? 0;
    if (appCounter == null) {
      appCounter = 0;
    } else {
      appCounter = appCounter! + 1;
    }
    await prefs.setInt('appCounter', appCounter!);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deleteCounter() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have pushed the button $appCounter many times:',
            ),
            ElevatedButton(
              onPressed: () {
                deleteCounter();
              },
              child: const Text('Reset Counter'),
            )
          ],
        ),
      ),
    );
  }
}