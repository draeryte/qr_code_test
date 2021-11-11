import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/timer_provider.dart';
import 'dart:async';

class CountDownTimer {
  late Timer timer;

  void startTimer(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (context.read<TimerProvider>().timeLeft == 0) {
        timer.cancel();
      } else {
        context.read<TimerProvider>().subtractTimer();
      }
    });
  }
}
