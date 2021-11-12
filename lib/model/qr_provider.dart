import 'package:flutter/material.dart';
import 'package:qr_code_test/model/seed_model.dart';

class QrProvider extends ChangeNotifier {
  Seed? _seed;

  get seedValue => _seed;

  updateSeed(Seed? seed) {
    _seed = seed;

    notifyListeners();
  }
}
