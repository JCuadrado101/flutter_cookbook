import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String? result;
  Future<Response> getData() async {
    const String authority = 'www.googleapis.com';
    const String path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri uri = Uri.https(authority, path);
    return await http.get(uri);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(Duration(seconds: 3));
    return 3;
  }

  Future returnError() {
    throw ('Error');
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = 'Total: $total';
    });
  }

  Completer? completer;
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer!.future;
  }
  calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5), () {
        completer?.complete(42);
      });
    } catch (e) {
      completer?.completeError(e);
    }
  }

  void returnFG()  {
    FutureGroup<int> futureGroup = FutureGroup();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((int value) {
        total += value;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
               returnError()
                 .then((value) {
                   setState(() {
                     result = 'Success';
                   });
                 }
               ).catchError((error) {
                 setState(() {
                   result = 'Error';
                 });
               }).whenComplete(() {
                 setState(() {
                   result = 'Complete';
                 });
               });
              },
              child: const Text('GO'),
            ),
            const Spacer(),
            Text(result.toString()),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        )
      ),
    );
  }
}
