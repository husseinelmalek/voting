abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginChangeShowState extends LoginStates{}
class VotingLoginLoadingState extends LoginStates{}
class VotingLoginSuccessState extends LoginStates{}
class VotingLoginErrorState extends LoginStates{
  late String error;
  VotingLoginErrorState(this.error);
}