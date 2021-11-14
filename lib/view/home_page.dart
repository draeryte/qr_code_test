import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:qr_code_test/controller/api/get_seed.dart';
import 'package:qr_code_test/controller/services/connectivity.dart';
import 'package:qr_code_test/controller/services/hive_services.dart';

import 'package:qr_code_test/model/seed_model.dart';
import 'package:qr_code_test/view/component/button_child.dart';
import 'package:qr_code_test/view/component/fab_popout_button.dart';

import 'package:qr_code_test/view/qr_code_view.dart';
import 'package:qr_code_test/view/scan_view.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

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
      home: MyHomePage(
        box: HiveServices.getSeedFromMemory('seed'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Box<Seed> box;
  const MyHomePage({required this.box, Key? key}) : super(key: key);

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
  //Checks if device is connected to a network
  //If connected to the network and a Seed is in the QrProvider state manager then push to the QR Screen

  @override
  Widget build(BuildContext context) {
    //List of children of popup buttons for floating action button
    List<SpeedDialChild> buttonChildren = [
      ButtonChild(
          text: 'Scan',
          icon: const Icon(Icons.camera_alt),
          pressed: () {
            Navigator.push(
              context,
              (MaterialPageRoute(
                builder: (context) => const ScanView(),
              )),
            );
          }),
      ButtonChild(
          text: "QR Code",
          icon: const Icon(Icons.qr_code),
          pressed: () async {
            bool isConnected = await connected();
            Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) => QRCodeViewer(connection: isConnected),
                )));
          })
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      //Create and configures pop up floating action button
      floatingActionButton:
          PopOutFloatingActionButton(buttonChildren: buttonChildren),
      body: Center(child: text[index]),
    );
  }
}
