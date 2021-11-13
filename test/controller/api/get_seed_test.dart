import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:qr_code_test/controller/api/get_seed.dart';


void main() {
  test('get seed ...', () async {
    final seedAPI = Networking();
    seedAPI.client = MockClient((request) async {
      return Response(
          json.encode(
              {'seed': 'abcdefghijkl', 'expiresAT': "2021-11-12T21:45:30"}),
          200);
    });

    //  Seed? seed = await seedAPI.getSeed(context);
  });
}
