import 'package:flutter/material.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';
import 'package:qr_code_test/model/seed_model.dart';
import 'package:qr_code_test/model/timer_provider.dart';
import 'package:qr_code_test/view/qr_code_view.dart';
import 'package:qr_code_test/view/scan_view.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Widget> pages = [];

class _MyHomePageState extends State<MyHomePage> {
  isQRCodeActive() async {
    if (context.read<QrProvider>().seedValue != null &&
        DateTime.parse(context.read<QrProvider>().seedValue.expiresAt)
            .isAfter(DateTime.now())) {
      //   context.read<TimerProvider>().startTimer();
      Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => const QRCodeViewer(),
          )));
      return true;
    } else {
      Seed? seed = await getSeed();
      if (seed != null) {
        context.read<QrProvider>().updateSeed(seed);
        context.read<TimerProvider>().getTimeToExpire(seed.expiresAt);

        //   context.read<TimerProvider>().startTimer();
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => const QRCodeViewer(),
          )),
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      //Create and configures pop up  floating action button
      floatingActionButton: SpeedDial(
        child: const Icon(Icons.add),
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.camera_alt),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            label: 'Scan',
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) => const ScanView(),
                )),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            label: 'QR Code',
            onPressed: () async {
              isQRCodeActive();
            },
          ),
        ],
        closedForegroundColor: Colors.white,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.blue,
        openBackgroundColor: Colors.black,
      ),
    );
  }
}
