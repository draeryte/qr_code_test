# qr_code_test

QrCode Test is an app used to generate and display a qr code fetched from a server. This qr code is refreshed automatically when the fetched data expires.

### Dependencies 
  flutter_dotenv: ^5.0.2,
  qr_flutter: ^4.0.0,
  qr_code_scanner: ^0.6.1,
  simple_speed_dial: ^0.1.3,
  http: ^0.13.4,
  provider: ^6.0.1,
  hive_flutter: ^1.1.0,
  hive: ^2.0.4,
  connectivity: ^3.0.6,
  
### Code Snippets


Function connected returns true if device is connected via mobile or wifi
```
Future<bool> connected() async {
...
}
```

Hive Services is a class with one static method which gets the storage box "seed" and allows for all the operations of a Hive Box
```
class HiveServices {
  static Box<Seed> getSeedFromMemory() => Hive.box<Seed>("/*name of box*/");
}

```


