import 'package:flutter/material.dart';
import 'package:name_code/Utilities/BoardData.dart';
import 'package:name_code/Utilities/Constats.dart';
import 'package:provider/provider.dart';

class RegulartInfoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          Provider.of<BoardData>(context).getRemainigBlueCards().toString() +
              " Cards to go",
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: blueColor,
          ),
        ),
        Text(
          Provider.of<BoardData>(context).isRedTurn()
              ? "Red's turn"
              : "Blue's turn",
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: Provider.of<BoardData>(context).isRedTurn()
                ? redColor
                : blueColor,
          ),
        ),
        Text(
          Provider.of<BoardData>(context).getRemainigRedCards().toString() +
              " Cards to go",
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: redColor,
          ),
        )
      ],
    );
  }
}
