import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/cubit/regidtration_cubit/registration_cubit.dart';
import 'package:la_vie/business_logic/cubit/regidtration_cubit/registration_states.dart';

import '../../widgets/mobile/global/logo.dart';
import '../../widgets/mobile/registration/login_container.dart';
import '../../widgets/mobile/registration/other_registration.dart';
import '../../widgets/mobile/registration/registration_background.dart';
import '../../widgets/mobile/registration/registration_text.dart';
import '../../widgets/mobile/registration/sign_up_container.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = 'kerolos1';
    lastNameController.text = 'faie1';
    emailController.text = 'kokofaie7@gmail.com';
    passwordController.text = '11AAaa@@';
    confirmPasswordController.text = '11AAaa@@';
    return BlocProvider(
      create: (BuildContext context) => RegistrationCubit(),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (BuildContext context, RegistrationState state) {
          if (state is SignUpErrorRegistrationState) {
            print("++++++++++++++++++++++++");
          } else if (state is SignUpSuccessRegistrationState) {
            // showToast(message: state.registrationModel.message);
            ScaffoldMessenger.of(context)
                .showSnackBar(
                SnackBar(content: Text(state.registrationModel.message)));
            print("-------------------------");
            // print(state.registrationModel.message);
            // print(state.registrationModel.toMap());
          }
        },
        builder: (BuildContext context, RegistrationState state) {
          RegistrationCubit cub = RegistrationCubit.get(context);
          return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    registrationBackground(context: context),
                    Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 7,
                              ),
                              logo(fontSize: 27),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  registrationText(
                                      text: 'Sign Up',
                                      isClick: !cub.registrationFlag,
                                      onTap: () {
                                        cub.changeRegistration(false);
                                      }),
                                  registrationText(
                                      text: 'Login',
                                      isClick: cub.registrationFlag,
                                      onTap: () {
                                        cub.changeRegistration(true);
                                      })
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 20,
                              ),
                              cub.registrationFlag
                                  ? loginContainer(
                                  onTap: () {
                                    cub.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        buildContext: context);
                                  },
                                  context: context,
                                  emailController: emailController,
                                  passwordController: passwordController)
                                  : signUpContainer(
                                formKey: formKey,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cub.signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        firstName:
                                        firstNameController.text,
                                        lastName: lastNameController.text,
                                        buildContext: context);
                                  }
                                },
                                context: context,
                                emailController: emailController,
                                passwordController: passwordController,
                                confirmPasswordController:
                                confirmPasswordController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController,
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 40,
                              ),
                              otherRegistration(
                                  onPressGoogle: () {}, onPressFacebook: () {}),
                            ],
                          ),
                        )),
                  ],
                )),
          );
        },
      ),
    );
  }
}
