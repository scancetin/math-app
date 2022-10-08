import 'package:flutter/material.dart';
import 'package:math_quiz_arch/constants/constants.dart';
import 'package:math_quiz_arch/models/question.dart';
import 'package:math_quiz_arch/screens/game_screen.dart';
import 'package:math_quiz_arch/widgets/number_widget.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared_prefs.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Question>(builder: (context, model, child) {
      return Row(
        children: [
          const Spacer(flex: 2),
          Expanded(flex: 3, child: summary(model)),
          Expanded(flex: 2, child: nextButton(model, context)),
          // Spacer(),
        ],
      );
    });
  }

  Widget summary(Question model) {
    return Center(
      child: NumberWidget(
        textValue: model.usersAnswer % 1 == 0 ? model.usersAnswer.toStringAsFixed(0) : model.usersAnswer.toStringAsFixed(1),
        fontSize: Constants.USER_ANSWER_SIZE,
      ),
    );
  }

  Widget nextButton(Question model, BuildContext context) {
    return IconButton(
      onPressed: () {
        _showMaterialDialog(context, model);
      },
      iconSize: Constants.NEXT_BUTTON_SIZE,
      alignment: Alignment.centerLeft,
      icon: const Icon(
        Icons.navigate_next_rounded,
        color: Constants.TEXT_COLOR,
      ),
    );
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
              title: Center(
                  child: Text(
                Constants.POPUP_TEXT,
                style: GoogleFonts.lato(textStyle: const TextStyle(color: Constants.POPUP_TEXT_COLOR, fontSize: Constants.POPUP_TEXT_SIZE)),
              )),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context, true);
                  },
                  child: Text(Constants.POPUP_ACTIONS_TEXT[0],
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: Constants.POPUP_TEXT_COLOR, fontSize: Constants.POPUP_ACTIONS_TEXT_SIZE))),
                ),
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
