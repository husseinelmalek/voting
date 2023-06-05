import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/models/identify_candidate.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/screensStepper/center_Step_screen.dart';
import 'package:first_project/modules/screensStepper/last_stepper_screen.dart';
import 'package:first_project/modules/screensStepper/start_step_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:first_project/shared/component/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  static HomeScreenCubit get(context) => BlocProvider.of(context);

  int activeStep = 0;
  int upperBound = 2;
  void inReachedStep(int index) {
    activeStep = index;
    emit(VotingInReachedStepSuccessState());
  }

  void backStep() {
    activeStep--;
    emit(VotingBackStepSuccessState());
  }

  void nextStep() {
    activeStep++;

    emit(VotingNextStepSuccessState());
  }

  List<Widget> screens = [
    StartStepScreen(),
    CenterStepScreen(),
    LastStepScreen(),
  ];
  List<IdentityModel> ellects = [];
  void getEllectors() {
    FirebaseFirestore.instance.collection('ellectors').get().then((value) {
      value.docs.forEach((element) {
        ellects.add(IdentityModel.fromJson(element.data()));
        print(ellects[0].id);
        emit(VotingGetEllectDataSuccessState());
      });
    }).catchError((onError) {
      emit(VotingGetEllectDataErrorState(onError.toString()));
    });
  }

  void addEllectData({
    required String age,
    required String id,
  }) {
    IdentityModel model = IdentityModel(age: age, id: id, uId: id);

    FirebaseFirestore.instance
        .collection('ellectors')
        .doc(model.uId)
        .set(model.toJson())
        .then((value) {
      emit(VotingAddEllectDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingAddEllectDataErrorState(onError.toString()));
    });
  }
}
