import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_cookbook/chapter3/immutable_widget.dart';
import 'package:flutter_cookbook/chapter3/text_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Welcome to Flutter'),
        actions: const [
          Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: const Center(
            child: Text('I\'m a drawer')
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset('assets/image.jpg'),
            ),
          ),
          const TextLayout(),
        ],
      ),
    );
  }
}

