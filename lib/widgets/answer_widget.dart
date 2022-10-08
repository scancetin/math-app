import 'package:flutter/material.dart';
import 'package:math_quiz_arch/constants/constants.dart';
import 'package:math_quiz_arch/models/question.dart';
import 'package:math_quiz_arch/widgets/number_widget.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Consumer<Question>(builder: (context, model, child) {
        return NumberWidget(textValue: model.correctAnswer.toStringAsFixed(0), fontSize: Constants.ANSWER_SIZE);
      }),
    );
  }
}
