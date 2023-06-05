import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/models/voting_user_model.dart';
import 'package:first_project/shared/component/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VotingCubit extends Cubit<VotingStates> {
  VotingCubit() : super(VotingInitialState());
  static VotingCubit get(context) => BlocProvider.of(context);

  void logOut() {
    FirebaseAuth.instance.signOut();

    emit(VotingLogOutState());
  }

  int pageIndex = 0;
  void changeIndecator(index) {
    pageIndex = index;
    emit(VotingChangeIndecatorState());
  }

  int index = 1;
  CandidatesModel? model;
  List<CandidatesModel> cands = [];
  List<String> candidds = [];
  void getCandidateData() {
    emit(GetCandidateDataLoadingState());

    FirebaseFirestore.instance.collection('candidates').get().then((value) {
      // print(value.docs);
      // candidds.add(value.docs);
      // print('$candidds this is that youuuuuuuuuuuuuuuuuuu');
      value.docs.forEach(
        (element) {
          // print(element.id);
          candidds.add(element.id);

          cands.add(CandidatesModel.fromJson(element.data()));
          model = CandidatesModel.fromJson(element.data());
          // print(model);
          // element.reference.get().then((value) {
          // print(value.data());
          // model = CandidatesModel.fromJson(value.data());
          // cands?.add(CandidatesModel.fromJson(value.data()));
          // print(cands[0].bio);
          emit(GetCandidateDataSuccessState());
          // });
        },
      );
      // model = CandidatesModel.fromJson(value.data());
      // print(model?.name.toString());

      // cands.add(CandidatesModel.fromJson(value.data()!));
    }).catchError((onError) {
      print(onError.toString());
      emit(GetCandidateDataErrorState(onError.toString()));
    });
  }

  String confirm = DateFormat.yMMMd().format(DateTime.now()).toString();

  void getDate(value) {
    confirm = value;
    emit(GetState());
  }

  VotingUserModel? votingUserModel;

  void getUserData() {
    emit(VotingGetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // print('${value.data()} ');
      votingUserModel = VotingUserModel.fromJson(value.data());
      // print(votingUserModel?.image);
      emit(VotingGetUserDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingGetUserDataErrorState(onError.toString()));
    });
  }

  void heVote() {
    VotingUserModel model = VotingUserModel(
        isVoted: true,
        image: votingUserModel?.image,
        uId: votingUserModel?.uId,
        email: votingUserModel?.email,
        name: votingUserModel?.name,
        phone: votingUserModel?.phone);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      emit(ErrorVoteState());
    });
  }

  File? fileImage;
  var picker = ImagePicker();
  Future<void> getImagePicker() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      fileImage = File(PickedFile.path);
      emit(VotingPickProfileImageSuccessState());
    } else {
      print('no iamge picked');
      emit(VotingPickProfileImageErrorState());
    }
  }

  void uploadImageProfile() {
    emit(VotingUploadImageProfileLoadingState());
    getUserData();
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(fileImage!.path).pathSegments.last}')
        .putFile(fileImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserdate(image: value);
      });
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingUploadImageProfileErrorState(onError));
    });
  }

  void updateUserdate({
    String? image,
  }) {
    emit(VotingUpdateUserDataLoadingState());
    VotingUserModel model = VotingUserModel(
        image: image ?? votingUserModel?.image,
        uId: votingUserModel?.uId,
        email: votingUserModel?.email,
        name: votingUserModel?.name,
        phone: votingUserModel?.phone);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      print(onError.toString());
      emit(VotingUpdateUserDataErrorState(onError.toString()));
    });
  }

  void increaseVote(int votes, int index) {
    CandidatesModel model2 = CandidatesModel(
      // name: model?.name != null ? '' : model?.name,
      // bio: model?.bio != null ? '' : model?.bio,
      // imageCandidate:
      // model?.imageCandidate != null ? '' : model?.imageCandidate,
      // uIdCan: model?.uIdCan != null ? '' : model?.uIdCan,
      votes: votes + 1,
    );
    FirebaseFirestore.instance
        .collection('candidates')
        .doc(candidds[index])
        .update({'votes': FieldValue.increment(1)}).then((value) {
      emit(SuccessUdateVotesState());
    }).catchError((onError) {
      print('${onError.toString()} errrrrrrrrrrrrrrrr');
      emit(ErrorUdateVotesState());
    });
  }
}
