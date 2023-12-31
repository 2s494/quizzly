import 'package:flutter/material.dart';
import 'package:quizzly/controllers/quiz_controller.dart';
import 'package:quizzly/models/quiz_model.dart';
import 'package:quizzly/views/app_routes.dart';
import 'package:quizzly/views/quiz_widget/answer_button.dart';
import 'package:quizzly/views/quiz_widget/back_button.dart';
import 'package:quizzly/views/quiz_widget/body_widget.dart';
import 'package:quizzly/views/quiz_widget/bottom_sheet_widget.dart';

import 'package:quizzly/views/quiz_widget/quiz_stats.dart';

class QuizScreen extends StatefulWidget {
  static const String id = "/quiz";

  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizController controller;
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    List<Quiz> quizData =
        ModalRoute.of(context)!.settings.arguments as List<Quiz>;
    controller = QuizController(
        updater: setState, quiz: quizData.first, dataQuiz: quizData);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Body(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// This is Back Button on Go To IntroScreen
                AppBackButton(
                  onPress: () => AppRoutes.goToIntro(context),
                ),

                /// This is Quiz Info's
                QuizStat(controller: controller),
                const SizedBox(height: 20),

                /// This is Answer Buttons
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// This is for in Answer Buttons
                      for (int i = 0; i < controller.quiz.answers.length; i++)
                        /// Custom Button
                        AnswerButton(
                          onPress: () => controller.changeQuiz(controller.quiz.answers[i], context),
                          label: "${controller.quiz.answers[i]}",
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      ///
      bottomSheet: const BottomSheetWidget(),
    );
  }
}

