abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class VotingInReachedStepSuccessState extends HomeScreenStates {}

class VotingBackStepSuccessState extends HomeScreenStates {}

class VotingNextStepSuccessState extends HomeScreenStates {}

class VotingAddEllectDataLoadingState extends HomeScreenStates {}

class VotingAddEllectDataSuccessState extends HomeScreenStates {}

class VotingAddEllectDataErrorState extends HomeScreenStates {
  final String error;

  VotingAddEllectDataErrorState(this.error);
}

class VotingGetEllectDataLoadingState extends HomeScreenStates {}

class VotingGetEllectDataSuccessState extends HomeScreenStates {}

class VotingGetEllectDataErrorState extends HomeScreenStates {
  final String error;

  VotingGetEllectDataErrorState(this.error);
}
