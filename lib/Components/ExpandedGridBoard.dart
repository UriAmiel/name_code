import 'package:flutter/material.dart';
import 'package:name_code/Components/GameCardButton.dart';
import 'package:name_code/Utilities/BoardData.dart';
import 'package:expanded_grid/expanded_grid.dart';

class ExpandedGridBoard extends StatefulWidget {
  final int columns;
  final int rows;
  final BoardData boardData;

  ExpandedGridBoard(
      {@required this.columns, @required this.rows, @required this.boardData});

  @override
  _ExpandedGridBoardState createState() => _ExpandedGridBoardState();
}

class _ExpandedGridBoardState extends State<ExpandedGridBoard> {
  List<ExpandedGridContent> _cards = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.columns; i++) {
      for (int j = 0; j < widget.rows; j++) {
        _cards.add(ExpandedGridContent(
          columnIndex: i,
          rowIndex: j,
          rowSpan: 1,
          columnSpan: 1,
          child: GameCardButton(
            word: widget.boardData.getWord((i * widget.columns) + j),
            cardColor: widget.boardData.getColor((i * widget.columns) + j),
            boardData: widget.boardData,
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedGrid(
      column: widget.columns,
      row: widget.rows,
      children: _cards,
    );
  }
}
