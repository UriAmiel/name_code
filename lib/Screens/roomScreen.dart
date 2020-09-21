import 'package:flutter/material.dart';
import 'package:name_code/Screens/boardScreen.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BoardScreen(
                //TODO: implement a way to choose number of rows and cols
                columns: 4,
                rows: 4,
              );
            },
          ),
        );
      }),
    );
  }
}
