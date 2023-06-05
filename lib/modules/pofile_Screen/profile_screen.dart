import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/models/voting_user_model.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VotingUserModel? model = VotingCubit.get(context).votingUserModel;

    return BlocConsumer<VotingCubit, VotingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var profileImage = VotingCubit.get(context).fileImage;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Profile'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey[300],
          ),
          body: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        radius: 83,
                        child: CircleAvatar(
                          backgroundImage:
                              VotingCubit.get(context).fileImage != null
                                  ? FileImage(profileImage!) as ImageProvider
                                  : NetworkImage('${model?.image}'),
                          radius: 80,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue[300],
                        child: IconButton(
                          onPressed: () {
                            VotingCubit.get(context)
                                .getImagePicker()
                                .then((value) {
                              VotingCubit.get(context)
                                  .uploadImageProfile();
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${model?.name?.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Profile Setting',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Edit your profile image',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Edit your personal name',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'app Setting',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'notifications',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  defaultButton(
                      function: () {
                        VotingCubit.get(context).logOut();
                      },
                      text: 'LOG OUT',
                      background: Colors.blueGrey.shade300,
                      textColor: Colors.white)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
