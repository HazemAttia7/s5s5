import 'package:flutter/foundation.dart';
import 'package:s5s5/core/models/selected_assistances.dart';
import 'package:s5s5/core/models/team_model.dart';

ValueNotifier<Team> team1Notifier = ValueNotifier(
  Team(name: "Team 1", assistances: ["الحفرة", "اتصال بصديق", "جاوب إجابتين"]),
);

ValueNotifier<Team> team2Notifier = ValueNotifier(
  Team(name: "Team 2", assistances: ["الحفرة", "اتصال بصديق", "جاوب إجابتين"]),
);

ValueNotifier<SelectedAssistances> team1SelectedAssistances = 
    ValueNotifier(SelectedAssistances());

ValueNotifier<SelectedAssistances> team2SelectedAssistances = 
    ValueNotifier(SelectedAssistances());
