import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/models/voting_candidates_model.dart';
import 'package:first_project/models/voting_user_model.dart';
import 'package:first_project/modules/Candidate_profile/candidate_profile.dart';
import 'package:first_project/modules/home_screen/home_screen.dart';
import 'package:first_project/modules/login_screen/login_screen.dart';
import 'package:first_project/modules/pofile_Screen/profile_screen.dart';
import 'package:first_project/modules/results_screen/results_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class VotingLayout extends StatelessWidget {
  VotingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: VotingCubit.get(context).tabs.length,
      child: BlocConsumer<VotingCubit, VotingStates>(
        listener: (context, state) {
          if (state is VotingLogOutState) {
            navigateAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[300],
              title: Image(
                height: 50,
                width: 200,
                image: AssetImage(
                  'assets/images/vote.png',
                ),
              ),
              centerTitle: true,
              bottom: TabBar(
                // tabs: VotingCubit.get(context).tabs,
                tabs: [
                  Tab(
                    text: 'ONGOINGELECTIONS',
                  ),
                  Tab(
                    text: 'UPCOMINGELECTIONS',
                  ),
                ],

                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                labelColor: Colors.white,

                unselectedLabelColor: Colors.white,
                // indicator: BoxDecoration(
                //   color: Colors.cyanAccent,
                //   borderRadius: BorderRadius.circular(30.0),
                // ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    navigateTo(context, ProfileScreen());
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${VotingCubit.get(context).votingUserModel?.image}'),
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                // ifffffffffffffffffffffffffffffff
                VotingCubit.get(context).votingUserModel?.isVoted == false
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 200,
                                child: CarouselSlider(
                                  items: [
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                'https://t3.ftcdn.net/jpg/03/51/51/28/360_F_351512882_2kFH8IaSe4lyA7SXBLzEXyGKNEgbO1iH.jpg'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'let \'s vote to the candidate ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                'https://t3.ftcdn.net/jpg/03/51/51/28/360_F_351512882_2kFH8IaSe4lyA7SXBLzEXyGKNEgbO1iH.jpg'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'let \'s vote to the candidate ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                'https://t3.ftcdn.net/jpg/03/51/51/28/360_F_351512882_2kFH8IaSe4lyA7SXBLzEXyGKNEgbO1iH.jpg'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'let \'s vote to the candidate ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 170,
                                    autoPlay: false,
                                    enableInfiniteScroll: false,
                                    animateToClosest: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1 / 1.3,
                                    onPageChanged: (index, reason) {
                                      VotingCubit.get(context)
                                          .changeIndecator(index);
                                    },
                                    padEnds: true,
                                  ),
                                ),
                              ),
                            ),
                            CarouselIndicator(
                              count: 3,
                              index: VotingCubit.get(context).pageIndex,
                              color: Colors.grey,
                              activeColor: Colors.blueAccent,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 230,
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      height: 150,
                                      width: double.infinity,
                                      color: Colors.blueGrey[300],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${VotingCubit.get(context).cands.length} Candidates',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.yellow,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 190,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ConditionalBuilder(
                                        condition: VotingCubit.get(context)
                                            .cands
                                            .isNotEmpty,
                                        builder: (context) {
                                          return ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                buildCadidateItem(
                                                    VotingCubit.get(context)
                                                        .cands[index],
                                                    index,
                                                    context),
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: 10,
                                            ),
                                            itemCount: VotingCubit.get(context)
                                                .cands
                                                .length,
                                          );
                                        },
                                        fallback: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: defaultButton(
                                  function: () {
                                    navigateTo(context, HomeScreen());
                                  },
                                  text: 'Vote',
                                  textColor: Colors.white,
                                  background: Colors.blueGrey.shade300),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 180,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 7,
                                    blurStyle: BlurStyle.normal,
                                    spreadRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(23.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'you have just voted!'.toUpperCase(),
                                      style: GoogleFonts.alegreyaSc().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'there are no ongoing Ellections. we will send you a reminder for the next ellection',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Image(
                              image: NetworkImage(
                                  'https://www.ashevillenc.gov/wp-content/uploads/2019/06/election-illustration.png'),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(children: [
                              Expanded(
                                child: defaultButton(
                                    function: () {
                                      navigateTo(context, ResultsScreen());
                                    },
                                    text: 'show results'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: defaultButton(
                                    function: () {
                                      DefaultTabController.of(context)
                                          ?.animateTo(1,
                                              duration: Duration(seconds: 2),
                                              curve: Curves.linearToEaseOut);
                                    },
                                    background: Colors.blueGrey.shade300,
                                    textColor: Colors.white,
                                    text: 'UpcomingEllections',
                                    isUpperCase: false),
                              ),
                            ]),
                          ],
                        ),
                      ),
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: CalendarDatePicker(
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024, 3, 22, 12),
                          initialDate: DateTime(2023, 4, 21),
                          onDateChanged: (value) {
                            VotingCubit.get(context)
                                .getDate(DateFormat.yMMMd().format(value));
                          },
                        ),
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.blueGrey[300],
                        elevation: 10,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'the time of your vote',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${VotingCubit.get(context).confirm}',
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_vert,
                                    ))
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildVoting() => Container(
        color: Colors.blueGrey,
        child: Column(children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://news.uchicago.edu/sites/default/files/styles/full_width/public/images/2019-07/Mobile%20voting.jpg?itok=oezMDWp-')),
          Text('hello vote'),
        ]),
      );

  Widget buildCadidateItem(CandidatesModel model, index, context) => InkWell(
        onTap: () {
          navigateTo(
              context,
              CandidateProfile(
                name: model.name!,
                image: model.imageCandidate!,
                bio: model.bio!,
              ));
        },
        child: Container(
          // height: 200,
          color: Color.fromARGB(255, 241, 199, 199),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 48,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        // 'https://i.insider.com/63fd2468b8468e001896b999?width=1136&format=jpeg'
                        '${model.imageCandidate}'),
                    radius: 45,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    '${model.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  child: Text('${model.votes}'),
                  radius: 13,
                ),
              ],
            ),
          ),
        ),
      );
}
