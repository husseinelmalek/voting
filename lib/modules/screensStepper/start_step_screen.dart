import 'dart:ffi';

import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/modules/Candidate_profile/candidate_profile.dart';
import 'package:first_project/modules/home_screen/cubit/cubit.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/pofile_Screen/profile_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StartStepScreen extends StatelessWidget {
  const StartStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'choose your preferred candidate',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildHomeVotingItem(
                          VotingCubit.get(context).cands[index],
                          context,
                          index),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                      itemCount: VotingCubit.get(context).cands.length),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHomeVotingItem(CandidatesModel model, context, index) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 10,
                color: Colors.grey,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 53,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            // 'https://i.insider.com/63fd2468b8468e001896b999?width=1136&format=jpeg'
                            '${model.imageCandidate}'),
                        radius: 50,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              '${model.name}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 200,
                            height: 70,
                            child: Text(
                              '${model.bio}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: defaultButton(
                      function: () {
                        navigateTo(
                            context,
                            CandidateProfile(
                                name: model.name!,
                                image: model.imageCandidate!,
                                bio: model.bio!));
                      },
                      text: 'view profile',
                      background: Colors.white,
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: defaultButton(
                      function: () {
                        HomeScreenCubit.get(context).nextStep();
                        VotingCubit.get(context)
                            .increaseVote(model.votes!, index);
                      },
                      text: 'vote',
                      background: Colors.blueGrey.shade300,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
