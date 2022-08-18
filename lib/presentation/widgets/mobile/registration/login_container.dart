import 'package:flutter/material.dart';
import 'package:la_vie/presentation/widgets/mobile/registration/registration_button.dart';
import 'package:la_vie/presentation/widgets/mobile/registration/registration_text_field.dart';

Widget loginContainer({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required GestureTapCallback onTap,
  required BuildContext context,
}) {
  return SizedBox(
    child: Column(
      children: [
        registrationTextField(
          control: emailController,
          text: 'E-mail',
          type: TextInputType.emailAddress,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        registrationTextField(
            control: passwordController,
            text: 'Password',
            type: TextInputType.emailAddress,
            obscure: true),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        registrationButton(context: context, text: "Login", onTap: onTap),
      ],
    ),
  );
}
