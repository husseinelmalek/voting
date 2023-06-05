abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class RegisterChangeShowState extends RegisterStates {}

class VotingRegisterLoadingState extends RegisterStates {}

class VotingRegisterSuccessState extends RegisterStates {}

class VotingRegisterErrorState extends RegisterStates {
  late String error;
  VotingRegisterErrorState(this.error);
}

class VotingCreateLoadingState extends RegisterStates {}

class VotingCreateSuccessState extends RegisterStates {}

class VotingCreateErrorState extends RegisterStates {
  late String error;
  VotingCreateErrorState(this.error);
}
