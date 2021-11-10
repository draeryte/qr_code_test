import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  DateTime timeNow = DateTime.now();
  late Timer _timer;

  late DateTime _timeToExpire;
  int _startTime = 9999;
  final oneSec = const Duration(seconds: 1);

  get timeLeft => _startTime;
  timeToExpire(String timeToExpiration) {
    _timeToExpire = DateTime.parse(timeToExpiration);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  subtractTimer() {
    _startTime--;
    notifyListeners();
  }

  startTimer() {
    _startTime = _timeToExpire.difference(timeNow).inSeconds;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startTime == 0) {
          timer.cancel();

          notifyListeners();
        } else {
          _startTime--;
          notifyListeners();
        }
      },
    );
  }

  getTimeToExpire() {
    _startTime = timeNow.difference(_timeToExpire).inSeconds;
    notifyListeners();
  }
}
