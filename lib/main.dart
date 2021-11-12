import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/qr_provider.dart';
import 'package:qr_code_test/model/time_provider.dart';

import 'package:qr_code_test/view/home_page.dart';

void main() async {
  //Load environment file
  await dotenv.load(fileName: ".env");
  //Creates state providers for Time and QrCodes to hold state in the app
  //Runs material app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TimerProvider()),
    ChangeNotifierProvider(create: (context) => QrProvider()),
  ], child: const MyApp()));
}
