import 'package:flutter/material.dart';
import 'package:name_code/unesed/GameCardColumn.dart';
import 'package:name_code/Utilities/BoardData.dart';

class RowOfCoulmns extends StatefulWidget {
  final int numberOfColumns;
  final int numberOfWordsInColumn;

  RowOfCoulmns(
      {@required this.numberOfColumns, @required this.numberOfWordsInColumn});

  @override
  _RowOfCoulmnsState createState() => _RowOfCoulmnsState();
}

class _RowOfCoulmnsState extends State<RowOfCoulmns> {
  List<Widget> _generateRow() {
    List<GameCardColumn> list = [];

    BoardData _wordsList =
        BoardData(widget.numberOfWordsInColumn * widget.numberOfColumns);

    for (int i = 0; i < widget.numberOfColumns; i++) {
      list.add(
        GameCardColumn(
          numberOfCards: widget.numberOfWordsInColumn,
          columnNumber: i,
          wordsList: _wordsList,
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
