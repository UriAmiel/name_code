import 'package:flutter/material.dart';
import 'package:name_code/Utilities/BoardData.dart';

class GameCardButton extends StatefulWidget {
  final String word;
  final Color cardColor;
  final BoardData boardData;

  GameCardButton(
      {@required this.word, this.cardColor, @required this.boardData});

  @override
  _GameCardButtonState createState() => _GameCardButtonState();
}

class _GameCardButtonState extends State<GameCardButton> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(
          () {
            MaterialColor currCardColor = widget.cardColor;

            widget.boardData.playTurn(currCardColor, context);
            color = currCardColor;
          },
        );
      },
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.teal),
      ),
      child: Text(
        widget.word,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
