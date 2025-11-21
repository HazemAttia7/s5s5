import 'package:flutter/material.dart';
import 'package:s5s5/core/models/selected_assistances.dart';
import 'package:s5s5/core/models/team_model.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/game/presentation/views/widgets/assistance_tool.dart';

class AssistanceTools extends StatefulWidget {
  final ValueNotifier<Team> teamNotifier;
  final ValueNotifier<SelectedAssistances> selectedAssistancesNotifier;
  final bool showHole, showCallFriend, showTwoAnswers;
  const AssistanceTools({
    super.key,
    this.showHole = false,
    this.showCallFriend = false,
    this.showTwoAnswers = false,
    required this.teamNotifier,
    required this.selectedAssistancesNotifier,
  });

  @override
  State<AssistanceTools> createState() => _AssistanceToolsState();
}

class _AssistanceToolsState extends State<AssistanceTools> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        spacing: 15,
        children: [
          Text(
            "وسائل المساعدة",
            style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                AssistanceTool(
                  icon: Icons.sports_handball_rounded,
                  isDisabled:
                      !(widget.teamNotifier.value.assistances.contains(
                            "الحفرة",
                          ) &&
                          widget.showHole),
                  isSelected:
                      widget.selectedAssistancesNotifier.value.isHoleSelected,
                  onTap: () {
                    setState(() {
                      final current = widget
                          .selectedAssistancesNotifier
                          .value
                          .isHoleSelected;
                      widget.selectedAssistancesNotifier.value.isHoleSelected =
                          !current;
                      widget.selectedAssistancesNotifier.notifyListeners();
                    });
                  },
                ),
                AssistanceTool(
                  icon: Icons.phone,
                  isDisabled:
                      !(widget.teamNotifier.value.assistances.contains(
                            "اتصال بصديق",
                          ) &&
                          widget.showCallFriend),
                  isSelected: widget
                      .selectedAssistancesNotifier
                      .value
                      .isCallFriendSelected,
                  onTap: () {
                    setState(() {
                      final current = widget
                          .selectedAssistancesNotifier
                          .value
                          .isCallFriendSelected;
                      widget
                              .selectedAssistancesNotifier
                              .value
                              .isCallFriendSelected =
                          !current;
                      widget.selectedAssistancesNotifier.notifyListeners();
                    });
                  },
                ),
                AssistanceTool(
                  icon: Icons.looks_two_outlined,
                  isDisabled:
                      !(widget.teamNotifier.value.assistances.contains(
                            "جاوب إجابتين",
                          ) &&
                          widget.showTwoAnswers),
                  isSelected: widget
                      .selectedAssistancesNotifier
                      .value
                      .isTwoAnswersSelected,
                  onTap: () {
                    setState(() {
                      final current = widget
                          .selectedAssistancesNotifier
                          .value
                          .isTwoAnswersSelected;
                      widget
                              .selectedAssistancesNotifier
                              .value
                              .isTwoAnswersSelected =
                          !current;
                      widget.selectedAssistancesNotifier.notifyListeners();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
