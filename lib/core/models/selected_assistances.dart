class SelectedAssistances {
  bool isHoleSelected;
  bool isCallFriendSelected;
  bool isTwoAnswersSelected;

  SelectedAssistances({
    this.isHoleSelected = false,
    this.isCallFriendSelected = false,
    this.isTwoAnswersSelected = false,
  });

  void reset() {
    isHoleSelected = false;
    isCallFriendSelected = false;
    isTwoAnswersSelected = false;
  }
}