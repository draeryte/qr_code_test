import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_test/model/constants.dart';
import 'package:qr_code_test/model/qr_provider.dart';
import 'package:qr_code_test/model/seed_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/time_provider.dart';

//Makes a get request to server
//
//Creates a seed then returns that seed.
//Returns null if response is not 200
//Throws an exception if returned with an error

Future<Seed?> getSeed(BuildContext context) async {
  Uri url = Uri.parse(baseUrl + "/default/random-qr-seed_seed");

  Map<String, String> headers = {'x-api-key': apiKey};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      //Takes json response and converts it to a Seed
      Seed seed = Seed.fromJson(json.decode(response.body));

      //Saves seed in QrProvider state management
      context.read<QrProvider>().updateSeed(seed);

      //Saves expiration time in TimerProvider
      context
          .read<TimerProvider>()
          .getTimeToExpire(context.read<QrProvider>().seedValue.expiresAt);

      //Returns seed
      return seed;
    } else {
      return null;
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
