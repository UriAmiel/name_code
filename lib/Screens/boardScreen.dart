import 'package:flutter/material.dart';
import 'package:name_code/Components/ExpandedGridBoard.dart';
import 'package:name_code/Components/UpperInfoRow.dart';
import 'package:name_code/Utilities/BoardData.dart';

class BoardScreen extends StatefulWidget {
  final int columns;
  final int rows;

  BoardScreen({@required this.columns, @required this.rows});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  BoardData _boardData;
  @override
  void initState() {
    super.initState();
    _boardData = BoardData(widget.columns * widget.rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: UpperInfoRow(boardData: _boardData),
            ),
            Expanded(
              flex: 10,
              child: ExpandedGridBoard(
                columns: widget.columns,
                rows: widget.rows,
                boardData: _boardData,
              ),
            ),
            Expanded(
              child: Row(),
            ),
          ],
        ),
      ),
    );
  }
}
