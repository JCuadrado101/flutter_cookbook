import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter5/platform_alert.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final itemHeight = 60.0;
  final scrollController = ScrollController();
  int milliseconds = 0;
  Timer? timer;
  bool isTicking = false;
  final laps = <int>[];

  void _onTick(Timer timer) {
    setState(() {
      milliseconds += 100;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear();
    });
  }
  

  void stopTimer(BuildContext context) {
    setState(() {
      timer?.cancel();
      isTicking = false;
    });
    final controller = showBottomSheet(
        context: context,
        builder: _buildRunCompleteSheet);

    Future.delayed(Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

   Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (int total, int lap) {
      return total + lap;
    });
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Run Finished', style: textTheme.headline6),
                Text('Total Runtime: ${_secondsText(totalRuntime)}'),
              ],
            ),
          )
        )
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }
  
  void _lap() {
    setState(() {
      laps.add(milliseconds);
    });
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
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
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildLapDisplay(){
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
          itemBuilder: (context, index) {
          final milliseconds = laps[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
              title: Text('Lap ${index + 1}'),
              trailing: Text(_secondsText(milliseconds)),
            );
          }
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
    Object? name = ModalRoute.of(context)?.settings.arguments ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name.toString(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCounter(context),
          ),
          Expanded(
            child: _buildLapDisplay(),
          ),
        ]
      )
    );
  }

  Row _buildControls() {
    return Row(
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
                isTicking ? null : startTimer();
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
                  isTicking ? _lap() : null;
                }
            ),
            const SizedBox(width: 20),
            Builder(
              builder: (context) {
                return TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty
                          .all(Colors.red),
                      foregroundColor: MaterialStateProperty
                          .all(Colors.white),
                    ),
                  onPressed: () {
                      isTicking ? stopTimer(context) : null;
                  },
                  child: const Text('Stop')
                );
              }
            )
          ],
        );
  }
}