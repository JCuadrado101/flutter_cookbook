import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  Timer? timer;
  bool isTicking = true;
  final laps = <int>[];

  void _onTick(Timer timer) {
    setState(() {
      ++milliseconds;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear();
    });
  }
  
  

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isTicking = false;
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }
  
  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Laps ${laps.length + 1}', 
            style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white)
          ),
          Text(_secondsText(milliseconds),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white)
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stop Watch'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty
                      .all(Colors.green),
                  foregroundColor: MaterialStateProperty
                    .all(Colors.white),
                ),
                child: const Text('Start'),
                onPressed: () {
                  startTimer();
                }
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty
                        .all(Colors.yellow),
                  ),
                  child: const Text('Lap'),
                  onPressed: () {
                    isTicking ? _lap : null;
                  }
              ),
              const SizedBox(width: 20),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty
                        .all(Colors.red),
                    foregroundColor: MaterialStateProperty
                        .all(Colors.white),
                  ),
                onPressed: () {
                    stopTimer();
                },
                child: const Text('Stop')
              )
            ],
          )
        ],
      ),
    );
  }
}