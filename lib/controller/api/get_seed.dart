import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:qr_code_test/controller/services/hive_services.dart';

import 'package:qr_code_test/model/constants.dart';

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
  final box = HiveServices.getSeedFromMemory();
  Map<String, String> headers = {'x-api-key': apiKey};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      //Takes json response and converts it to a Seed
      Seed seed = Seed.fromJson(json.decode(response.body));

      //Saves expiration time in TimerProvider

      //Saves seed to Hive database at index 0
      box.putAt(0, seed);

      //Saves state of timer duration in seconds
      context
          .read<TimerProvider>()
          .getTimeToExpire(seed.expiresAt, DateTime.now());

      //Returns seed
      return seed;
    } else {
      return null;
    }
  } catch (e) {
    //If an exception is thrown then it returns the previous qr code saved at index 0 in the Hive database
    return box.getAt(0);
  }
}
