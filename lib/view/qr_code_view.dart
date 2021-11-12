import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';
import 'package:qr_code_test/model/qr_provider.dart';

import 'package:qr_code_test/model/time_provider.dart';
import 'package:qr_code_test/view/component/qr_code_widget.dart';

class QRCodeViewer extends StatefulWidget {
  const QRCodeViewer({Key? key}) : super(key: key);

  @override
  _QRCodeViewerState createState() => _QRCodeViewerState();
}

class _QRCodeViewerState extends State<QRCodeViewer> {
//Initializes view with a new timer and time to expiration for current active seed.
//Decrements the the startTime in Time Provider by 1 until countdown hits 0 then requests another seed using refresh seed function
  @override
  void initState() {
    super.initState();
    context.read<TimerProvider>().isSeedExpired(context);
    Duration oneSecond = const Duration(seconds: 1);
    Timer.periodic(oneSecond, (Timer t) {
      if (context.read<TimerProvider>().timeLeft == 0) {
        setState(() {
          refreshSeed();
          context
              .read<TimerProvider>()
              .getTimeToExpire(context.read<QrProvider>().seedValue.expiresAt);
          t.cancel();
        });
      } else {
        context.read<TimerProvider>().subtractTimer();
      }
    });
  }

//Gets new seed by calling getSeed function and saves it to QrProvider
  void refreshSeed() async {
    getSeed(context);
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
