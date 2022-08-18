import 'package:flutter/material.dart';
import 'package:la_vie/presentation/widgets/mobile/registration/registration_button.dart';
import 'package:la_vie/presentation/widgets/mobile/registration/registration_text_field.dart';

Widget signUpContainer({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  required GestureTapCallback onTap,
  required BuildContext context,
  required Key formKey,
}) {
  return Form(
      key: formKey,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: registrationTextField(
                    control: firstNameController,
                    text: 'First Name',
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Expanded(
                  child: registrationTextField(
                    control: lastNameController,
                    text: 'Last Name',
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            registrationTextField(
              control: emailController,
              text: 'E-mail',
              type: TextInputType.emailAddress,
              validate: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            registrationTextField(
                control: passwordController,
                text: 'Password',
                type: TextInputType.emailAddress,
                obscure: false,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            registrationTextField(
                control: confirmPasswordController,
                text: 'Confirm Password',
                type: TextInputType.emailAddress,
                obscure: false,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            registrationButton(context: context, text: "Sign Up", onTap: onTap),
          ],
        ),
      ));
}
