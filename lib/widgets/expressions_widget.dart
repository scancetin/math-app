import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_quiz_arch/constants/constants.dart';
import 'package:math_quiz_arch/models/question.dart';
import 'package:math_quiz_arch/screens/game_screen.dart';
import 'package:math_quiz_arch/widgets/number_widget.dart';
import 'package:provider/provider.dart';
import '../utils/shared_prefs.dart';

class ExpressionsWidget extends StatelessWidget {
  const ExpressionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(child: expButton(Constants.EXPS[0], context)),
        Expanded(child: expButton(Constants.EXPS[1], context)),
        Expanded(child: expButton(Constants.EXPS[2], context)),
        Expanded(child: expButton(Constants.EXPS[3], context)),
        const Spacer(),
      ],
    );
  }

  Widget expButton(String exp, BuildContext context) {
    return Consumer<Question>(builder: (context, model, child) {
      return GestureDetector(
        child: NumberWidget(textValue: exp, fontSize: 30),
        onTap: () {
          if (model.usersExps.contains(Constants.EMPTY_SPACE)) {
            model.addExpression(exp);
            model.calcUsersSum();
            model.isSumCorrect() ? _showMaterialDialog(context, model) : null;
          }
        },
      );
    });
  }

  void _showMaterialDialog(BuildContext context, Question model) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              backgroundColor: Constants.POPUP_COLOR,
              title: Column(
                children: [
                  Center(
                      child: Text(
                    model.correctAnswer.toStringAsFixed(0),
                    style: GoogleFonts.lato(textStyle: const TextStyle(color: Constants.POPUP_TEXT_COLOR, fontSize: Constants.POPUP_TEXT_SIZE * 2)),
                  )),
                  const SizedBox(height: 10),
                  Center(
                      child: Text(
                    "Level ${UserSimplePrefs.getLevel()} completed",
                    style: GoogleFonts.lato(textStyle: const TextStyle(color: Constants.POPUP_TEXT_COLOR, fontSize: Constants.POPUP_TEXT_SIZE)),
                  )),
                  // const SizedBox(height: 20),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    model.newQuestion();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
                    await UserSimplePrefs.setLevel();
                  },
                  child: Text(Constants.POPUP_ACTIONS_TEXT[1],
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: Constants.POPUP_TEXT_COLOR, fontSize: Constants.POPUP_ACTIONS_TEXT_SIZE))),
                )
              ],
            ),
          );
        });
  }
}
