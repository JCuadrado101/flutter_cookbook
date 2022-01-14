import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProvider extends StatefulWidget {
  const PathProvider({Key? key}) : super(key: key);

  @override
  _PathProviderState createState() => _PathProviderState();
}

class _PathProviderState extends State<PathProvider> {
  String documentPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';


  @override
  initState() {
    super.initState();
    _getDocumentPath().then((_) {
      myFile = File('$documentPath/myFile.txt');
      writeFile();
    });
  }

  Future<void> _getDocumentPath() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();
    setState(() {
      documentPath = docDirectory.path;
      tempPath = tempDirectory.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Mozzarella, and Basil');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileText = await myFile.readAsString();
      setState(() {
        this.fileText = fileText;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Document Path: $documentPath'),
            Text('Temp Path: $tempPath'),
            ElevatedButton(
              onPressed: () {
                readFile();
              },
              child: const Text('Read File'),
            ),
            Text('File Text: $fileText'),
          ],
        ),
      ),
    );
  }
}
