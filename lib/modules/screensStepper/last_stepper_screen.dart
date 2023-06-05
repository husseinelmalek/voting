import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/voting_layout.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/modules/home_screen/cubit/cubit.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/results_screen/results_screen.dart';
import 'package:first_project/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LastStepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CandidatesModel? model = VotingCubit.get(context).model[index];
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // return Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     // crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 40,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(10.0),
        //         child: Text(
        //           'Are your sure you want to vote for this candidate ? once confirmed,this is action cannot be undone.',
        //           style: TextStyle(
        //             fontSize: 17,
        //             fontWeight: FontWeight.w400,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(25.0),
        //         child: Container(
        //           height: 200,
        //           child: Stack(
        //             alignment: Alignment.topCenter,
        //             children: [
        //               Align(
        //                 alignment: Alignment.bottomCenter,
        //                 child: Container(
        //                   width: 300,
        //                   height: 130,
        //                   alignment: Alignment.bottomCenter,
        //                   decoration: BoxDecoration(
        //                     color: Colors.blueGrey[300],
        //                     borderRadius: BorderRadius.circular(30),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 20),
        //                     child: Text(
        //                       'nmnmjk',
        //                       style: TextStyle(
        //                           fontSize: 18,
        //                           fontWeight: FontWeight.bold,
        //                           color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               CircleAvatar(
        //                 backgroundColor: Colors.white,
        //                 radius: 73,
        //                 child: CircleAvatar(
        //                   backgroundImage: AssetImage('assets/images/vote.png'),
        //                   radius: 70,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 25),
        //         child: defaultButton(function: () {}, text: 'confirm'),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 25),
        //         child: defaultButton(
        //             function: () {}, text: 'cancel', background: Colors.white),
        //       ),
        //     ],
        //   ),
        // );
        return Column(
          children: [
            Image(
              image: AssetImage('assets/images/success.png'),
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Thank You',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                'your vote has submitted successfully',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultButton(
                  function: () {
                    navigateTo(context, ResultsScreen());
                  },
                  text: 'show results',
                  background: Colors.blueGrey),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: defaultButton(
                  function: () {
                    navigateTo(context, VotingLayout());
                  },
                  text: 'Home Screen',
                  background: Colors.white),
            )
          ],
        );
      },
    );
  }
}
