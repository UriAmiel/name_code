import 'dart:math';
import 'package:flutter/material.dart';
import 'package:three_words/three_words.dart';
import 'Constats.dart';

class BoardData {
  List<String> _wordsList;
  List<MaterialColor> _colorsList;
  bool _redTurn;
  int _remainigRedCards;
  int _remainigBlueCards;
  int _noColorCards;
  // TO THINK: CHANGE NUMBER OF ASSAISIN CARDS DEPEND ON NUMBER OF TOTAL CARDS
  int assasinCard = 1;

  BoardData(int numberOfWords) {
    // gets random english words with more than 3 letters
    this._wordsList = Words().randomWords(number: numberOfWords);

    _randomizeColors(numberOfWords);
  }

  String getWord(int index) {
    return _wordsList[index];
  }

  MaterialColor getColor(int index) {
    return _colorsList[index];
  }

  int getRemainigRedCards() {
    return this._remainigRedCards;
  }

  int getRemainigBlueCards() {
    return this._remainigBlueCards;
  }

  // This method returns who's turn it is right now, true = red, false = blue
  bool isRedTurn() {
    return _redTurn;
  }

  void _randomizeColors(int numberOfWords) {
    this._colorsList = [];

    initNumberOfCardsForTean(numberOfWords);

    for (int i = 0; i < _remainigRedCards; i++) {
      this._colorsList.add(redColor);
    }
    for (int i = 0; i < _remainigBlueCards; i++) {
      this._colorsList.add(blueColor);
    }
    for (int i = 0; i < _noColorCards; i++) {
      this._colorsList.add(whiteGray);
    }
    for (int i = 0; i < assasinCard; i++) {
      this._colorsList.add(black);
    }

    this._colorsList.shuffle();
  }

  // init number of cards in each team:
  void initNumberOfCardsForTean(int numberOfWords) {
    int thirdOfCards = (numberOfWords / 3).round();
    this._remainigRedCards = thirdOfCards;
    this._remainigBlueCards = thirdOfCards;
    this._noColorCards = thirdOfCards - assasinCard;

    Random rand = Random();
    double zeroToOne = rand.nextDouble();

    if (zeroToOne > 0.5) {
      this._remainigRedCards++;
      this._redTurn = true;
    } else {
      this._remainigBlueCards++;
      this._redTurn = false;
    }
  }

  void switchTurns() {
    _redTurn = !_redTurn;
  }

  void playTurn(MaterialColor currCardColor, BuildContext context) {
    // Red's turn
    if (_redTurn) {
      print("This is Red's turn");
      // Red is correct
      if (currCardColor == redColor) {
        print("Red is correct");
      }
      // red is incorrect
      else {
        print("Red is incorrect");
        print("Switching turns...");

        switchTurns();
      }
    }
    // Blue's turn
    else {
      print("This is Blue's turn");

      // Blue is correct
      if (currCardColor == blueColor) {
        print("Blue is correct");
      }
      // Blue is incorrect
      else {
        print("Blue is incorrect");
        print("Switching turns...");
        switchTurns();
      }
    }
  }
}
