import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/modules/Candidate_profile/candidate_profile.dart';
import 'package:first_project/modules/home_screen/cubit/cubit.dart';
import 'package:first_project/modules/home_screen/cubit/states.dart';
import 'package:first_project/modules/pofile_Screen/profile_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..getEllectors(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[300],
              // if(HomeScreenCubit.get(context).activeStep==)
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (() {
                  if (HomeScreenCubit.get(context).activeStep == 1) {
                    HomeScreenCubit.get(context).backStep();
                  } else {
                    Navigator.pop(context);
                  }
                }),
              ),
              title: Image(
                height: 50,
                width: 200,
                image: AssetImage(
                  'assets/images/vote.png',
                ),
              ),
              centerTitle: true,
              actions: [
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        navigateTo(context, ProfileScreen());
                      },
                      icon: Icon(
                        Icons.person,
                      )),
                  backgroundColor: Colors.blueGrey,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: Column(children: [
              IconStepper(
                activeStep: HomeScreenCubit.get(context).activeStep,
                icons: [
                  Icon(Icons.start),
                  Icon(Icons.flag_circle),
                  Icon(Icons.how_to_vote),
                ],
                activeStepBorderColor: Colors.amber,
                activeStepBorderWidth: 3.0,
                scrollingDisabled: false,
                stepReachedAnimationEffect: Curves.bounceInOut,
                stepReachedAnimationDuration: Duration(seconds: 5),
                activeStepBorderPadding: 1.0,
                enableStepTapping: false,

                enableNextPreviousButtons: false,
                lineDotRadius: 2,

                lineColor: HomeScreenCubit.get(context).activeStep > 0
                    ? Colors.blue
                    : Colors.grey,

                // stepColor: Colors.amber,
                activeStepColor: Colors.blue,

                onStepReached: (index) {
                  HomeScreenCubit.get(context).inReachedStep(index);
                },
              ),

// here is the three screens

              HomeScreenCubit.get(context)
                  .screens[HomeScreenCubit.get(context).activeStep],

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: MaterialButton(
              //           onPressed: () {
              //             if (HomeScreenCubit.get(context).activeStep > 0) {
              //               HomeScreenCubit.get(context).backStep();
              //             }
              //           },
              //           child: Text(
              //             'back',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           color: Colors.deepPurple,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20.0,
              //       ),
              //       Expanded(
              //         child: MaterialButton(
              //           onPressed: () {
              //             if (HomeScreenCubit.get(context).activeStep <
              //                 HomeScreenCubit.get(context).upperBound) {
              //               HomeScreenCubit.get(context).nextStep();
              //             } else if (HomeScreenCubit.get(context).activeStep ==
              //                 HomeScreenCubit.get(context).upperBound) {
              //               navigateTo(context, ProfileScreen());
              //             }
              //           },
              //           child: Text(
              //             'Next',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           color: Colors.deepOrange,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ]),

            // body: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 1.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 1 / 1,
            //     children: List.generate(
            //       10,
            //       (index) => buildVoting(),
            //     ),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
