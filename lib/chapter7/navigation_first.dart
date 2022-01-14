import 'package:flutter/material.dart';

import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({Key? key}) : super(key: key);

  @override
  _NavigationFirstState createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color? color;

  _navigateAndGetColor(BuildContext context) async {
    Color color = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavigationSecond(),
      ),
    );
    print(color);
    setState(() {
      this.color = color;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(color);
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen'),
        backgroundColor: color,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateAndGetColor(context);
          },
          child: const Text('Change Color'),
        ),
      )
    );
  }
}
