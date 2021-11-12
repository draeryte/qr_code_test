import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_test/model/seed_model.dart';

class HiveServices {
  static Box<Seed> getSeedFromMemory() => Hive.box<Seed>("seed");
}
