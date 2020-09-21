import 'dart:math';
import 'package:flutter/material.dart';
import 'package:three_words/three_words.dart';
import 'Constats.dart';

class BoardData extends ChangeNotifier {
  List<String> _wordsList;
  List<MaterialColor> _colorsList;
  bool _redTurn;
  int _remainigRedCards;
  int _remainigBlueCards;
  int _noColorCards;
  // TO THINK: CHANGE NUMBER OF ASSAISIN CARDS DEPEND ON NUMBER OF TOTAL CARDS
  int assassinCard = 1;

  String _winningTeam;
  Color _winningColor;
  bool _isSomeoneWon = false;
  bool _isGameOver = false;

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

  String getWinningTeam() {
    return this._winningTeam;
  }

  Color getWinningColor() {
    return this._winningColor;
  }

  bool getSomeoneWon() {
    return this._isSomeoneWon;
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
    for (int i = 0; i < assassinCard; i++) {
      this._colorsList.add(black);
    }

    this._colorsList.shuffle();
  }

  // init number of cards in each team:
  void initNumberOfCardsForTean(int numberOfWords) {
    int thirdOfCards = (numberOfWords / 3).round();
    this._remainigRedCards = thirdOfCards;
    this._remainigBlueCards = thirdOfCards;
    this._noColorCards = thirdOfCards - assassinCard;

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

  void checkForWin() {
    if (this._remainigRedCards == 0) {
      redWin();
    }
    if (this._remainigBlueCards == 0) {
      blueWin();
    }
  }

  void redWin() {
    this._winningColor = redColor;
    this._winningTeam = "Red";
    endGame();
  }

  void blueWin() {
    this._winningColor = blueColor;
    this._winningTeam = "Blue";
    endGame();
  }

  void endGame() {
    this._isSomeoneWon = true;
    this._isGameOver = true;
  }

  void playTurn(MaterialColor currCardColor) {
    // Red's turn
    if (_redTurn) {
      // Red is correct
      if (currCardColor == redColor) {
        this._remainigRedCards--;
      }
      // Red is incorrect
      else {
        // Red lost by guessing the assassin
        if (currCardColor == black) {
          blueWin();
        }
        if (currCardColor == blueColor) {
          this._remainigBlueCards--;
        }
        switchTurns();
      }
    }
    // Blue's turn
    else {
      // Blue is correct
      if (currCardColor == blueColor) {
        this._remainigBlueCards--;
      }
      // Blue is incorrect
      else {
        // Blue lost by guessing the assassin
        if (currCardColor == black) {
          redWin();
        }
        if (currCardColor == redColor) {
          this._remainigRedCards--;
        }
        switchTurns();
      }
    }
    checkForWin();

    notifyListeners();
  }
}
