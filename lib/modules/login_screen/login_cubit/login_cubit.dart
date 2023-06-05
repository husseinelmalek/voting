import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/modules/login_screen/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);


  bool isShow=true;
  void changeShowPassword(){
    isShow=!isShow;
    emit(LoginChangeShowState());
  }

  void userLogin({
  required String email,
  required String password,
}){
    emit(VotingLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(VotingLoginSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(VotingLoginErrorState(onError.toString()));
    });

  }
}