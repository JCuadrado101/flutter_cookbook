import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color? color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                color = Colors.red[700];
                Navigator.pop(context, color);
              },
              child: const Text('Red'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Colors.green[700];
                Navigator.pop(context, color);
              },
              child: const Text('Green'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Colors.blue[700];
                Navigator.pop(context, color);
              },
              child: const Text('Blue'),
            ),
          ]
        ),
      )
    );
  }
}
