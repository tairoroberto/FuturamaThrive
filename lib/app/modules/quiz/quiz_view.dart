import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/core/theme/styles.dart';
import 'package:futurama_thrive/app/core/widgets/default_loading.dart';
import 'package:futurama_thrive/app/modules/quiz/question_view.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_controller.dart';
import 'package:provider/provider.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  QuizController controller = serviceLocator<QuizController>();

  @override
  void initState() {
    controller.getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futurama Quiz"),
      ),
      body: Consumer<QuizController>(
          builder: (context, controller, child) => _buildBody(controller)),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getQuestions();
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          )),
    );
  }

  Widget _buildBody(QuizController controller) {
    if (controller.loading) {
      return const DefaultLoading();
    }

    if (controller.error != null) {
      context.onWidgetDidBuild(() {
        showError(
            context, '${controller.error}', () => controller.getQuestions());
        controller.error = null;
      });
    }

    if (controller.response.items != null) {
      Question? item = controller.question;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 24.dp),
            child: SizedBox(
              width: double.maxFinite,
              child: Text(
                'You have answered ${controller.correctAnswer} of ${controller.response.items?.length} correctly',
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: QuestionView(
              question: item,
              onTap: (Question? question) {
                controller.validateAnswer(question?.userAnswer);
              },
            ),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}
