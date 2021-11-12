import 'package:flutter/material.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';
import 'package:qr_code_test/model/qr_provider.dart';
import 'package:qr_code_test/model/seed_model.dart';

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

//holds the index of the text list to be displayed in center of the home screen
int index = 0;

//Contains a list of standard messages displayed in the center of the home screen
List<Widget> text = [
  const Text("Choose an option using the FAB"),
  const Text("Can't get QR Code right now, try again later"),
];

class _MyHomePageState extends State<MyHomePage> {
  //Function checking if there's a seed saved in the state of the QrProvider or if the expired time hasn't passed.
  //If both are true then push to the QR View screen.
  //If either is false then call getSeed() to get a new seed and save it in QrProvider

  isQRCodeActive() async {
    if (context.read<QrProvider>().seedValue != null) {
      Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => const QRCodeViewer(),
          )));
    } else {
      Seed? seed = await getSeed(context);
      if (seed != null) {
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => const QRCodeViewer(),
          )),
        );
      } else {
        setState(() {
          index = 1;
        });
      }
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
      body: Center(child: text[index]),
    );
  }
}
