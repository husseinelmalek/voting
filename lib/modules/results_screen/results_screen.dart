import 'dart:ffi';

import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/modules/Candidate_profile/candidate_profile.dart';
import 'package:first_project/modules/home_screen/cubit/cubit.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/pofile_Screen/profile_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => VotingCubit()..getCandidateData(),
      child: BlocConsumer<VotingCubit, VotingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('results'),
              backgroundColor: Colors.blueGrey[300],
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('choose your preferred candidate',
                          style: GoogleFonts.almendraSc(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
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
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Votes : ',
                        style: GoogleFonts.aboreto().copyWith(
                          fontSize: 16,
                        )),
                    CircleAvatar(child: Text('${model.votes}')),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
