import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/models/voting_user_model.dart';
import 'package:first_project/modules/register_screen/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShow = true;
  void changeShowPassword() {
    isShow = !isShow;
    emit(RegisterChangeShowState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(VotingRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(name: name, email: email, phone: phone, uId: value.user!.uid);
      emit(VotingRegisterSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingRegisterErrorState(onError.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    VotingUserModel model = VotingUserModel(
      name: name,
      email: email,
      image:
          'https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg',
      phone: phone,
      uId: uId,
      isVoted: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(VotingCreateSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingCreateErrorState(onError.toString()));
    });
  }
}
