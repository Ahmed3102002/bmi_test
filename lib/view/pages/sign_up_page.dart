import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/services/validations_methods.dart';
import 'package:bmi/view/pages/custom_auth_page.dart';
import 'package:bmi/view/pages/log_in_page.dart';
import 'package:bmi/view/widgets/custom_auth_button.dart';
import 'package:bmi/view/widgets/custom_auth_ques.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:bmi/view/widgets/text_forms/custom_text_form.dart';
import 'package:bmi/view/widgets/text_forms/email_text_form.dart';
import 'package:bmi/view/widgets/text_forms/name_text_form.dart';
import 'package:bmi/view/widgets/text_forms/password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const routeName = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _ageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final UserAuthProvider authProvider =
        Provider.of<UserAuthProvider>(context);

    return CustomAuthPage(
      formKey: formKey,
      childern: [
        CustomText(
          text: 'SIGN UP',
          fontSize: 30,
          color: color,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        NameTextForm(
          nameController: _nameController,
          nameFocusNode: _nameFocusNode,
          emailFocusNode: _ageFocusNode,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CustomTextForm(
          nextFocusNode: _emailFocusNode,
          validator: ValidatorMethods.validationOfage,
          controller: _ageController,
          focusNode: _ageFocusNode,
          keyboardType: TextInputType.number,
          hintText: 'Enter your age',
          prefixIconData: Icons.person,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        EmailTextForm(
          emailController: _emailController,
          emailFocusNode: _emailFocusNode,
          passwordFocusNode: _passwordFocusNode,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        PasswordTextForm(
          passwordController: _passwordController,
          passwordFocusNode: _passwordFocusNode,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CustomButtons(
          pageTitle: 'SIGN UP',
          onPressed: () {
            try {
              if (formKey.currentState!.validate()) {
                authProvider.signUpToFirebase(
                  context: context,
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                  age: int.parse(_ageController.text.trim()),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          },
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        AuthQuestion(
          color: color,
          question: 'I have an account ,',
          pageTitle: 'Log in',
          fontSize: 22,
          page: LogInPage.routeName,
        ),
      ],
    );
  }
}
