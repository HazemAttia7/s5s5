import 'package:flutter/material.dart';
import 'package:s5s5/features/home/data/models/question_model.dart';
import 'package:s5s5/features/home/data/repos/home_repo_impl.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';
import 'package:s5s5/features/question/presentation/views/widgets/body_qr.dart';
import 'package:s5s5/features/question/presentation/views/widgets/category_badge.dart';
import 'package:s5s5/features/question/presentation/views/widgets/points_badge.dart';
import 'package:s5s5/features/question/presentation/views/widgets/body_text.dart';
import 'package:s5s5/features/question/presentation/views/widgets/show_answer_badge.dart';
import 'package:s5s5/features/question/presentation/views/widgets/team_selection_widget.dart';
import 'package:s5s5/features/question/presentation/views/widgets/timer_bar.dart';

class QuestionBody extends StatefulWidget {
  final int questionPoints;
  final String categoryName;
  final void Function({required bool isTeam1Win, required bool isTeam2Win})
  onQuestionClosed;

  const QuestionBody({
    super.key,
    required this.questionPoints,
    required this.categoryName,
    required this.onQuestionClosed,
  });

  @override
  State<QuestionBody> createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  bool showQuestion = true, showAnswer = false, showTeams = false;
  late Future<Question> _initQuestion;

  @override
  void initState() {
    super.initState();
    _initQuestion = HomeRepoImpl().getQuestionByCategoryAndPoints(
      categoryName: widget.categoryName,
      questionPoints: widget.questionPoints,
    );
  }

  void _handleTeamSelection(String teamName) {
    bool team1Won = teamName == team1Notifier.value.name;
    bool team2Won = teamName == team2Notifier.value.name;
    if (team1Won) {
      team1Notifier.value.points += widget.questionPoints;
      team1Notifier.notifyListeners();
    } else if (team2Won) {
      team2Notifier.value.points += widget.questionPoints;
      team2Notifier.notifyListeners();
    }
    widget.onQuestionClosed.call(isTeam1Win: team1Won, isTeam2Win: team2Won);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initQuestion,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              if (showTeams)
                TeamSelectionWidget(
                  onTeamSelected: _handleTeamSelection,
                  onQuestionClosed: widget.onQuestionClosed,
                )
              else
                getQrCategories()
                    ? BodyQR(
                        text: asyncSnapshot.data!.question,
                        imageUrl: asyncSnapshot.data!.image,
                      )
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: BodyText(
                          text: showQuestion
                              ? asyncSnapshot.data!.question
                              : asyncSnapshot.data!.answer,
                        ),
                      ),
              if (showQuestion)
                Positioned(
                  top: -30,
                  right: 65,
                  child: PointsBadge(questionPoints: widget.questionPoints),
                ),
              if (!showTeams)
                Positioned(
                  bottom: -15,
                  right: 65,
                  child: showQuestion
                      ? CategoryBadge(categoryName: widget.categoryName)
                      : CustomBadge(
                          backColor: Colors.red,
                          text: 'إرجع للسؤال',
                          width: 150,
                          onTap: () {
                            setState(() {
                              showQuestion = true;
                              showAnswer = false;
                            });
                          },
                        ),
                ),
              Positioned(
                bottom: -15,
                left: 65,
                child: showTeams
                    ? CustomBadge(
                        backColor: Colors.purple,
                        text: 'العودة للإجابة',
                        width: 170,
                        onTap: () {
                          setState(() {
                            showTeams = false;
                            showAnswer = true;
                          });
                        },
                      )
                    : showQuestion
                    ? CustomBadge(
                        backColor: Colors.green,
                        text: 'الإجابة',
                        onTap: () {
                          setState(() {
                            showQuestion = false;
                            showAnswer = true;
                          });
                        },
                      )
                    : CustomBadge(
                        backColor: Colors.blue,
                        text: 'أي فريق؟',
                        width: 120,
                        onTap: () {
                          setState(() {
                            showAnswer = false;
                            showTeams = true;
                          });
                        },
                      ),
              ),
              if (showQuestion)
                const Positioned(
                  top: -30,
                  left: 0,
                  right: 0,
                  child: Center(child: TimerBar()),
                ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              "السؤال حصل مشكلة وانا بجيبه يا برنس",
              style: TextStyle(fontSize: 100),
            ),
          );
        }
      },
    );
  }

  bool getQrCategories() {
    return (widget.categoryName.contains('من غير كلام') ||
            widget.categoryName.contains('كلمة و رسمة') ||
            widget.categoryName.contains('أه أو لأ') ||
            widget.categoryName.contains('الشفرة')) &&
        showQuestion;
  }
}
