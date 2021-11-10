import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

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
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        child: const Icon(Icons.add),
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.camera_alt),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            label: 'Scan',
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.directions_walk),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            label: 'QR Code',
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
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
