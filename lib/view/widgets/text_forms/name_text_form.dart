import 'package:bmi/services/validations_methods.dart';
import 'package:bmi/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';

class NameTextForm extends StatelessWidget {
  const NameTextForm({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.emailFocusNode,
  });

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      controller: nameController,
      focusNode: nameFocusNode,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Enter your name',
      prefixIconData: Icons.person_outline,
      validator: ValidatorMethods.validationOfName,
      nextFocusNode: emailFocusNode,
    );
  }
}
