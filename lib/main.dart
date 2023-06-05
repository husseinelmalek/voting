import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/layout/voting_layout/voting_layout.dart';
import 'package:first_project/modules/login_screen/login_screen.dart';
import 'package:first_project/modules/splash_screen/splash_screen.dart';
import 'package:first_project/modules/test.dart';
import 'package:first_project/shared/bloc_observer.dart';
import 'package:first_project/shared/component/constants.dart';
import 'package:first_project/shared/network/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CashHelper.int();
  uId = FirebaseAuth.instance.currentUser?.uid;
  Widget widget;
  if (uId != null) {
    widget = VotingLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VotingCubit()
        ..getUserData()
        ..getCandidateData(),
      child: BlocConsumer<VotingCubit, VotingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: startWidget,
          );
        },
      ),
    );
  }
}
