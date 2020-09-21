import 'package:flutter/material.dart';
import 'package:name_code/Components/GameCardButton.dart';
import 'package:name_code/Utilities/BoardData.dart';

class GameCardColumn extends StatelessWidget {
  final int numberOfCards;
  final int columnNumber;
  final BoardData wordsList;

  GameCardColumn(
      {@required this.numberOfCards,
      @required this.wordsList,
      @required this.columnNumber});

  List<Widget> _generateColumn() {
    List<GameCardButton> list = [];

    for (int i = 0; i < numberOfCards; i++) {
      list.add(GameCardButton(
        word: wordsList.getWord((columnNumber * numberOfCards) + i),
        cardColor: Colors.blue,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _generateColumn(),
      ),
    );
  }
}
