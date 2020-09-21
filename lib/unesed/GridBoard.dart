import 'package:flutter/material.dart';
import 'package:name_code/Components/GameCardButton.dart';
import 'package:name_code/Utilities/BoardData.dart';

class GridBoard extends StatefulWidget {
  final int numberOfColumns;
  final int numberOfWordsInColumn;

  GridBoard(
      {@required this.numberOfColumns, @required this.numberOfWordsInColumn});

  @override
  _GridBoardState createState() => _GridBoardState();
}

class _GridBoardState extends State<GridBoard> {
  List<GameCardButton> _cardsList = [];

  @override
  void initState() {
    super.initState();

    int totalNumberOfWords =
        widget.numberOfColumns * widget.numberOfWordsInColumn;
    BoardData boardData = BoardData(totalNumberOfWords);

    for (int i = 0; i < totalNumberOfWords; i++) {
      _cardsList.add(
        GameCardButton(
          word: boardData.getWord(i),
          cardColor: boardData.getColor(i),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      crossAxisCount: widget.numberOfColumns,
      children: _cardsList,
    );
  }
}
