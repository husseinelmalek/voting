import 'dart:math';

import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/modules/home_screen/home_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linecons_icons.dart';

class CandidateProfile extends StatelessWidget {
  late String image;
  late String name;
  late String bio;
  CandidateProfile({
    required this.name,
    required this.image,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<VotingCubit, VotingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(name),
              backgroundColor: Colors.blueGrey[300],
            ),
            body: Column(children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 150.0,
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                offset: Offset(0, 3),
                                blurStyle: BlurStyle.normal)
                          ],
                          color: Colors.blueGrey[300],
                          borderRadius: new BorderRadius.vertical(
                              bottom: new Radius.circular(300)),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 83,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(image),
                        radius: 80,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'About',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Contact',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'SHORT BIOGRAPHY',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '$bio he is the good man in the country of egypt hussein said mohamed bakr',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'ELECTION MAINFESTO',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '$bio he is the good man in the country of egypt hussein said mohamed bakr',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'KEY POINTS',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '⚈    he is  mohamed bakr',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '⚈    he is  mohamed bakr',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '⚈    hussein said mohaMED',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '⚈    Mohamed siad elmalek',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'SOCIAL NETWORKS',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook_sharp,
                                color: Colors.blueGrey,
                              ),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.telegram_sharp,
                                color: Colors.blueGrey,
                              ),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tiktok,
                                color: Colors.blueGrey,
                              ),
                              iconSize: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Linecons.globe,
                                color: Colors.blueGrey,
                              ),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: defaultButton(
                    function: () {
                      navigateTo(context, HomeScreen());
                    },
                    text: 'Vote'),
              ),
            ]),
          );
        },
      ),
    );
  }
}
