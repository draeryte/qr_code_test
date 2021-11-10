import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qr_code_test/model/constants.dart';
import 'package:qr_code_test/model/seed_model.dart';

Future<Seed?> getSeed() async {
  Uri url = Uri.parse(baseUrl + "/default/random-qr-seed_seed");

  Map<String, String> headers = {'x-api-key': apiKey};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Seed seed = Seed.fromJson(json.decode(response.body));
      print(seed.seed);
      return seed;
    } else {
      return null;
    }
  } catch (e) {
    log(e.toString());
  }
}
