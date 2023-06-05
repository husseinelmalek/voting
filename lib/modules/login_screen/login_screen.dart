import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/layout/voting_layout/voting_layout.dart';
import 'package:first_project/modules/login_screen/login_cubit/login_cubit.dart';
import 'package:first_project/modules/login_screen/login_cubit/login_states.dart';
import 'package:first_project/modules/register_screen/register_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is VotingLoginSuccessState) {
            navigateAndFinish(context, VotingLayout());
          } else if (state is VotingLoginErrorState) {
            showToast(text: state.error.toString(), state: ToastState.error);
            emailController.text = '';
            passwordController.text = '';
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(children: [
              Container(
                height: 180,
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Login Now!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30)),
                    color: Colors.blueGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     hintText:'email address',
                            //     hintStyle: TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                            //   keyboardType: TextInputType.emailAddress,
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            defaultTextFormField(
                              controller: emailController,
                              hint: 'email address',
                              prefixIcon: Icons.email,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'email must not be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              hintColor: Colors.grey,
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     hintText:'password',
                            //     hintStyle: TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            defaultTextFormField(
                              controller: passwordController,
                              hint: 'password',
                              prefixIcon: Icons.lock_open_outlined,
                              suffixIcon: LoginCubit.get(context).isShow
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              isPassword: LoginCubit.get(context).isShow,
                              onSuffixPressed: () {
                                LoginCubit.get(context).changeShowPassword();
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'password must not be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              hintColor: Colors.grey,
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            // Container(
                            //   width: double.infinity,
                            //
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     color: Colors.deepOrangeAccent,
                            //   ),
                            //   child: MaterialButton(onPressed: () {
                            //
                            //   }, child: Text('login'),
                            //     height: 50,
                            //   ),
                            //   clipBehavior: Clip.antiAliasWithSaveLayer,
                            // ),
                            defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'Login',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   width: double.infinity,
                            //
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     color: Colors.white,
                            //   ),
                            //   child: MaterialButton(onPressed: () {
                            //
                            //
                            //   }, child: Text('Register'),
                            //     height: 50,
                            //   ),
                            //   clipBehavior: Clip.antiAliasWithSaveLayer,
                            // ),
                            defaultButton(
                              function: () {
                                navigateAndFinish(context, RegisterScreen());
                              },
                              text: 'register',
                              background: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
