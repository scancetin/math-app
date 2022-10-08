import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_quiz_arch/constants/constants.dart';
import '../utils/shared_prefs.dart';
import '../widgets/expressions_widget.dart';
import '../widgets/navigation_widget.dart';
import '../widgets/question_widget.dart';
import '../widgets/answer_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Constants.RANDOM_COLOR[Random().nextInt(Constants.RANDOM_COLOR.length)],
          child: Column(
            children: [
              Expanded(flex: 1, child: levelTitle()),
              const Expanded(flex: 3, child: AnswerWidget()),
              const Expanded(flex: 2, child: NavigationWidget()),
              const Expanded(flex: 1, child: QuestionWidget()),
              const Expanded(flex: 1, child: ExpressionsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget levelTitle() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: const EdgeInsets.only(right: 20),
    child: Text("Level ${UserSimplePrefs.getLevel()}", style: const TextStyle(color: Constants.TEXT_COLOR, fontSize: Constants.LEVEL_TITLE_SIZE)),
  );
}
