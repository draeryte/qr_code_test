import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_test/model/seed_model.dart';

class TimerProvider extends ChangeNotifier {
  DateTime timeNow = DateTime.now();

  int _startTime = 0;
  final oneSec = const Duration(seconds: 1);

  get timeLeft => _startTime;

  // @override
  // void dispose() {
  //   _timer.cancel();

  //   super.dispose();
  // }

  subtractTimer() {
    _startTime--;
    notifyListeners();
  }

  // startTimer() {
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer _timer) {
  //       if (_startTime == 0) {
  //         _timer.cancel();

  //         notifyListeners();
  //       } else {
  //         _startTime--;
  //         notifyListeners();
  //       }
  //     },
  //   );
  // }

  // void startTimer(Timer timer) {
  //   timer = Timer.periodic(const Duration(seconds: 1), (_timer) {
  //     if (_startTime == 0) {
  //       timer.cancel();
  //       // setState(() {});
  //     } else {
  //       _startTime--;
  //     }
  //   });
  // }

  getTimeToExpire(String timeToExpiration) {
    _startTime = DateTime.parse(timeToExpiration).difference(timeNow).inSeconds;

    notifyListeners();
  }
}

class QrProvider extends ChangeNotifier {
  Seed? _seed;

  get seedValue => _seed;

  updateSeed(Seed seed) {
    _seed = seed;
    notifyListeners();
  }
}
