import 'package:first_project/layout/voting_layout/cubit/cubit_voting.dart';
import 'package:first_project/layout/voting_layout/cubit/states_voting.dart';
import 'package:first_project/layout/voting_layout/voting_layout.dart';
import 'package:first_project/modules/login_screen/login_screen.dart';
import 'package:first_project/modules/register_screen/cubit/register_cubit.dart';
import 'package:first_project/modules/register_screen/cubit/register_states.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is VotingCreateSuccessState) {
            navigateAndFinish(context, VotingLayout());
          } else if (state is VotingRegisterErrorState) {
            showToast(text: state.error.toString(), state: ToastState.error);
            emailController.text = '';
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
                    'Register Now!',
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
                            //     hintText:'user name',
                            //     hintStyle: TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                            //   keyboardType: TextInputType.emailAddress,
                            //
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            defaultTextFormField(
                              controller: userNameController,
                              hint: 'user name',
                              prefixIcon: Icons.person,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'user name must not be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              hintColor: Colors.grey,
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                              height: 20,
                            ),
                            defaultTextFormField(
                              controller: passwordController,
                              hint: 'password',
                              prefixIcon: Icons.lock_open_outlined,
                              suffixIcon: RegisterCubit.get(context).isShow
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              isPassword: RegisterCubit.get(context).isShow,
                              onSuffixPressed: () {
                                RegisterCubit.get(context).changeShowPassword();
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
                              height: 20,
                            ),
                            defaultTextFormField(
                              controller: phoneController,
                              hint: 'phone',
                              prefixIcon: Icons.phone,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'phone must not be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              hintColor: Colors.grey,
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: userNameController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                text: 'register'),
                            SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                                function: () {
                                  navigateAndFinish(context, LoginScreen());
                                },
                                text: 'login',
                                background: Colors.white),
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
