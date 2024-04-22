import 'package:bmi/services/validations_methods.dart';
import 'package:bmi/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';

class EmailTextForm extends StatelessWidget {
  const EmailTextForm({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    this.passwordFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final FocusNode? passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      controller: emailController,
      focusNode: emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Enter your email',
      prefixIconData: Icons.email_outlined,
      validator: ValidatorMethods.validationOfEmail,
      nextFocusNode: passwordFocusNode,
    );
  }
}
