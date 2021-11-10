import 'package:flutter/material.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';
import 'package:qr_code_test/view/component/qr_code_widget.dart';
import 'package:qr_code_test/model/seed_model.dart';

class QRCodeViewer extends StatefulWidget {
  const QRCodeViewer({Key? key}) : super(key: key);

  @override
  _QRCodeViewerState createState() => _QRCodeViewerState();
}

class _QRCodeViewerState extends State<QRCodeViewer> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
          child: FutureBuilder<Seed?>(
        future: getSeed(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          } else if (!snapshot.data) {
            return const Text("Loading your code");
          } else if (snapshot.data != null) {
            return QRCodeWidget(
                data: snapshot.data.seed,
                size: MediaQuery.of(context).size.width * .6);
          } else {
            return const Text("Something went wrong");
          }
        },
      )),
    );
  }
}
