import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/services/validations_methods.dart';
import 'package:bmi/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    final UserAuthProvider authProvider =
        Provider.of<UserAuthProvider>(context);
    const Color color = Colors.blue;
    return CustomTextForm(
      controller: passwordController,
      focusNode: passwordFocusNode,
      keyboardType: TextInputType.visiblePassword,
      hintText: 'Enter your password',
      prefixIconData: Icons.lock_outline,
      obscureText: authProvider.getIsVisiable,
      validator: ValidatorMethods.validationOfPassword,
      suffixIconButton: IconButton(
        onPressed: () => authProvider.setIsVisible,
        icon: Icon(
          authProvider.getIsVisiable
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: color,
        ),
      ),
    );
  }
}
