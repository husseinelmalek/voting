import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/modules/Candidate_profile/candidate_profile.dart';
import 'package:first_project/modules/home_screen/cubit/cubit.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/screensStepper/last_stepper_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:first_project/shared/component/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterStepScreen extends StatelessWidget {
  CenterStepScreen({super.key});
  var ageController = TextEditingController();
  var idController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {
        if (state is VotingAddEllectDataSuccessState) {
          HomeScreenCubit.get(context).nextStep();
        }
        if (state is VotingAddEllectDataErrorState) {
          showToast(text: 'your cant vote again ', state: ToastState.error);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Enter your identify document info',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultTextFormField(
                            controller: ageController,
                            hint: 'enter your age ',
                            maxChar: 2,
                            prefixIcon: Icons.perm_identity,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'id must not be emty';
                              }
                            },
                            keyboardType: TextInputType.number),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                            controller: idController,
                            maxChar: 14,
                            hint: 'enter your id number  ',
                            prefixIcon: Icons.perm_identity,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'id must not be empty';
                              }
                            },
                            keyboardType: TextInputType.number),
                        Image(
                          image: AssetImage('assets/images/id.png'),
                          height: 200,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                HomeScreenCubit.get(context).addEllectData(
                                    age: ageController.text,
                                    id: idController.text);
                                VotingCubit.get(context).heVote();
                              }
                            },
                            text: 'continue'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
