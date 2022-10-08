import 'package:flutter/material.dart';
import 'package:math_quiz_arch/calculator.dart';
import '../constants/constants.dart';

class Question extends ChangeNotifier {
  late List<List<dynamic>> _question;
  late double _correctAnswer;
  late double _usersAnswer;

  late List<dynamic> _questionNumbers;
  late List<dynamic> _questionExpressions;
  late List<String> _usersExpressions;

  late bool _completed;

  Question() {
    newQuestion();
  }

  void newQuestion() {
    _question = randLists();
    _questionNumbers = _question[0];
    _questionExpressions = _question[1];
    _correctAnswer = calculate(_questionNumbers, _questionExpressions);
    _usersExpressions = ["", "", ""];
    _usersAnswer = 0;
    _completed = false;
    notifyListeners();
  }

  List<dynamic> get questionNumbers => _questionNumbers;
  double get correctAnswer => _correctAnswer;
  double get usersAnswer => _usersAnswer;
  List<String> get usersExps => _usersExpressions;

  bool isSumCorrect() {
    if (_correctAnswer == _usersAnswer && !_usersExpressions.contains("")) {
      _completed = _correctAnswer == _usersAnswer;
    }
    return _completed;
  }

  void calcUsersSum() {
    _usersAnswer = calculate(_questionNumbers, _usersExpressions);
    notifyListeners();
  }

  void addExpression(String expression) {
    if (_usersExpressions[0] == Constants.EMPTY_SPACE) {
      _usersExpressions[0] = expression;
    } else if (_usersExpressions[1] == Constants.EMPTY_SPACE) {
      _usersExpressions[1] = expression;
    } else if (_usersExpressions[2] == Constants.EMPTY_SPACE) {
      _usersExpressions[2] = expression;
    }
    notifyListeners();
  }

  String getExpression(int index) {
    return _usersExpressions[index];
  }

  void deleteExpression(int index) {
    _usersExpressions[index] = Constants.EMPTY_SPACE;
    notifyListeners();
  }
}
