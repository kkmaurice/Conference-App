import 'dart:async';

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime eventDate;

  const CountdownWidget({required this.eventDate});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Duration? _timeLeft;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.eventDate.difference(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      } else {
        setState(() {
          _timeLeft = widget.eventDate.difference(DateTime.now());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int days = _timeLeft!.inDays;
    int hours = _timeLeft!.inHours.remainder(24);
    int minutes = _timeLeft!.inMinutes.remainder(60);
    int seconds = _timeLeft!.inSeconds.remainder(60);

    return widget.eventDate.isAfter(DateTime(2023, 7, 1))
        ? const Text('Event has Ended',
            style: TextStyle(fontSize: 18, color: Colors.white))
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '$days',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const Text(
                    'Days',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: <Widget>[
                  Text(
                    '$hours',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const Text(
                    'Hours',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: <Widget>[
                  Text(
                    '$minutes',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const Text(
                    'Minutes',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: <Widget>[
                  Text(
                    '$seconds',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const Text(
                    'Seconds',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ],
          );
  }
}
