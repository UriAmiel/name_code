import 'package:flutter/material.dart';
import 'package:name_code/unesed/GameCardColumn.dart';

class GameCardRow extends StatelessWidget {
  final int numberOfColumns;
  final int numberOfWordsInColumn;

  GameCardRow(
      {@required this.numberOfColumns, @required this.numberOfWordsInColumn});

  List<Widget> _generateRow() {
    List<GameCardColumn> list = [];

    for (int i = 0; i < numberOfColumns; i++) {
      list.add(
        GameCardColumn(
          numberOfCards: numberOfWordsInColumn,
          columnNumber: i,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _generateRow(),
    );
  }
}
