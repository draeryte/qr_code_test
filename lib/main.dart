import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/timer_provider.dart';

import 'package:qr_code_test/view/home_page.dart';

void main() async {
  //Load environment file
  await dotenv.load(fileName: ".env");
  //Creates provider to hold state in the app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TimerProvider()),
    ChangeNotifierProvider(create: (context) => QrProvider()),
  ], child: const MyApp()));
}
