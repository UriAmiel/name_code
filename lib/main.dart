import 'package:flutter/material.dart';
import 'package:name_code/Screens/boardScreen.dart';
import 'package:name_code/Screens/roomScreen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/roomScreen': (context) => RoomScreen(),
      },
      home: BoardScreen(
        columns: 4,
        rows: 4,
      ),
    );
  }
}
