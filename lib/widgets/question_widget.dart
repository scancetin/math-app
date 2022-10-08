import 'package:flutter/material.dart';
import 'package:math_quiz_arch/constants/constants.dart';
import 'package:math_quiz_arch/models/question.dart';
import 'package:math_quiz_arch/widgets/number_widget.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Question>(
      builder: (context, model, child) {
        return Row(
          children: [
            const Spacer(),
            Expanded(flex: 2, child: NumberWidget(textValue: model.questionNumbers[0].toInt().toString(), fontSize: Constants.NUMBER_SIZE)),
            Expanded(flex: 1, child: emptyAreaWidget(0, model)),
            Expanded(flex: 2, child: NumberWidget(textValue: model.questionNumbers[1].toInt().toString(), fontSize: Constants.NUMBER_SIZE)),
            Expanded(flex: 1, child: emptyAreaWidget(1, model)),
            Expanded(flex: 2, child: NumberWidget(textValue: model.questionNumbers[2].toInt().toString(), fontSize: Constants.NUMBER_SIZE)),
            Expanded(flex: 1, child: emptyAreaWidget(2, model)),
            Expanded(flex: 2, child: NumberWidget(textValue: model.questionNumbers[3].toInt().toString(), fontSize: Constants.NUMBER_SIZE)),
            const Spacer(),
          ],
        );
      },
    );
  }

  Widget emptyAreaWidget(int index, Question model) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
            flex: 2,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: model.getExpression(index) == Constants.EMPTY_SPACE ? Constants.EMPTY_AREA_COLOR : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                // color: model.getExpression(index) == Constants.EMPTY_SPACE ? Constants.EMPTY_AREA_COLOR : Colors.transparent,
                child: NumberWidget(
                  textValue: model.getExpression(index),
                  fontSize: Constants.NUMBER_SIZE,
                ),
              ),
              onTap: () {
                model.deleteExpression(index);
                model.calcUsersSum();
              },
            )),
        const Spacer(),
      ],
    );
  }
}
