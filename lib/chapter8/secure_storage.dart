import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StatefulWidget {
  const SecureStorage({Key? key}) : super(key: key);

  @override
  _SecureStorageState createState() => _SecureStorageState();
}

class _SecureStorageState extends State<SecureStorage> {
  final storage = const FlutterSecureStorage();
  String myKey = 'myPass';
  TextEditingController pwdController = TextEditingController();

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future readFromSecureStorage() async {
    final secret = await storage.read(key: myKey);
    return secret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pwdController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: writeToSecureStorage,
            ),
            ElevatedButton(
              onPressed: () {
                readFromSecureStorage().then((value) {
                  print(value);
                  setState(() {
                    myKey = value;
                  });
                });
              },
              child: const Text('Read'),
            ),
            Text(myKey),
          ],
        ),
      ),
    );
  }
}
