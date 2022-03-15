import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:futurama_thrive/app/core/styles.dart';

class QuestionView extends StatelessWidget {
  final Question? question;
  final Function? onTap;

  const QuestionView({Key? key, this.question, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.dp, left: 20.dp, top: 48.dp),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  '${question?.question}',
                  style: textRegularMedium.copyWith(
                      fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _buildItems()
          ],
        ),
      ),
    );
  }

  Column _buildItems() {
    return Column(
      children: question?.possibleAnswers
              ?.map((e) => Padding(
                    padding:
                        EdgeInsets.only(left: 16.dp, right: 16.dp, top: 8.dp),
                    child: GestureDetector(
                      onTap: () {
                        question?.userAnswer = e;
                        onTap?.call(question);
                      },
                      child: Card(
                        color: colorPrimary,
                        child: ListTile(
                          title: Text(
                            '$e',
                            style: bodyTextStyle.copyWith(
                                fontSize: 16.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList() ??
          [],
    );
  }
}
