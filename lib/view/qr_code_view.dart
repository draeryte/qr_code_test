import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_code_test/controller/services/start_timer.dart';

import 'package:qr_code_test/model/timer_provider.dart';
import 'package:qr_code_test/view/component/qr_code_widget.dart';

class QRCodeViewer extends StatefulWidget {
  const QRCodeViewer({Key? key}) : super(key: key);

  @override
  _QRCodeViewerState createState() => _QRCodeViewerState();
}

late Timer timer;

class _QRCodeViewerState extends State<QRCodeViewer> {
  @override
  void initState() {
    super.initState();
    CountDownTimer().startTimer(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QRCodeWidget(
                data: context.watch<QrProvider>().seedValue.seed,
                size: MediaQuery.of(context).size.width * .6),
            Consumer<TimerProvider>(builder: (context, value, child) {
              return Text("Expires in: ${value.timeLeft}");
            }),
          ],
        ),
      ),
    );
  }
}
