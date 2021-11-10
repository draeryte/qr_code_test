import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/timer_provider.dart';

import 'package:qr_code_test/view/home_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider(
      create: (context) => TimerProvider(), child: const MyApp()));
}
