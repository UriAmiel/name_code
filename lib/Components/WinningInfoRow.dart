import 'package:flutter/material.dart';
import 'package:name_code/Utilities/BoardData.dart';
import 'package:name_code/Utilities/Constats.dart';
import 'package:provider/provider.dart';

class WinningInfoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          Provider.of<BoardData>(context).getWinningTeam() + " Player Won !!!",
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: Provider.of<BoardData>(context).getWinningColor(),
          ),
        ),
        Text(
          'You may check the other words ',
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: Provider.of<BoardData>(context).getWinningColor(),
          ),
        ),
        Text(
          'Restart',
          style: TextStyle(
            fontSize: upperRowFontSize,
            color: Provider.of<BoardData>(context).getWinningColor(),
          ),
        ),
      ],
    );
  }
}
