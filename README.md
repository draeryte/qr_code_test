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
  
  
### How it works (High Level)
The home page holds a text widget and a Pop Out Floating Action button with two options, scan and qr. 
Scan moves to another screen which opens the camera to scan a qr code and presents the code information in a text widget. 

The qr option on the other hand, when tapped checks if there is an internet connection, if there is one and there is a code currently stored in the on device database we assume that code hasn't expired and move to the screen to view the Qr Code.
If there is no code in the device storage, the method getSeed is called, that new seed is stored and we move to the Qr Code screen. 
If there isn't a code, and getSeed returns a null value then a message is displayed on the home screen. 
If there is no connection and a code stored, move to the QrViewing screen. If there is no connection and also no code, we display appropriate message on the home screen.
  
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


