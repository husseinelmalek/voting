abstract class VotingStates {}

class VotingInitialState extends VotingStates {}

class VotingLogOutState extends VotingStates {}

class VotingChangeIndecatorState extends VotingStates {}

class GetCandidateDataLoadingState extends VotingStates {}

class GetCandidateDataSuccessState extends VotingStates {}

class GetCandidateDataErrorState extends VotingStates {
  final String error;

  GetCandidateDataErrorState(this.error);
}

class GetState extends VotingStates {}

class VotingGetUserDataLoadingState extends VotingStates {}

class VotingGetUserDataSuccessState extends VotingStates {}

class VotingGetUserDataErrorState extends VotingStates {
  final String error;

  VotingGetUserDataErrorState(this.error);
}

class VotingPickProfileImageLoadingState extends VotingStates {}

class VotingPickProfileImageSuccessState extends VotingStates {}

class VotingPickProfileImageErrorState extends VotingStates {}

class VotingUpdateUserDataLoadingState extends VotingStates {}

class VotingUpdateUserDataSuccessState extends VotingStates {}

class VotingUpdateUserDataErrorState extends VotingStates {
  final String error;

  VotingUpdateUserDataErrorState(this.error);
}

class VotingUploadImageProfileLoadingState extends VotingStates {}

class VotingUploadImageProfileSuccessState extends VotingStates {}

class VotingUploadImageProfileErrorState extends VotingStates {
  final String error;

  VotingUploadImageProfileErrorState(this.error);
}

class SuccessVoteState extends VotingStates {}

class SuccessUdateVotesState extends VotingStates {}

class ErrorUdateVotesState extends VotingStates {}

class ErrorVoteState extends VotingStates {}
