import 'package:flutter/material.dart';
import 'package:name_code/Utilities/BoardData.dart';
import 'package:name_code/Utilities/Constats.dart';

class UpperInfoRow extends StatelessWidget {
  const UpperInfoRow({
    Key key,
    @required BoardData boardData,
  })  : _boardData = boardData,
        super(key: key);

  final BoardData _boardData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          _boardData.getRemainigBlueCards().toString() + " Cards",
          style: TextStyle(
            fontSize: 20.0,
            color: blueColor,
          ),
        ),
        Text(
          _boardData.isRedTurn() ? "Red's turn" : "Blue's turn",
          style: TextStyle(
            fontSize: 20.0,
            color: _boardData.isRedTurn() ? redColor : blueColor,
          ),
        ),
        Text(
          _boardData.getRemainigRedCards().toString() + " Cards",
          style: TextStyle(
            fontSize: 20.0,
            color: redColor,
          ),
        )
      ],
    );
  }
}
