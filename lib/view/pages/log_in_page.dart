import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/view/pages/custom_auth_page.dart';
import 'package:bmi/view/pages/forget_password_page.dart';
import 'package:bmi/view/pages/sign_up_page.dart';
import 'package:bmi/view/widgets/custom_auth_button.dart';
import 'package:bmi/view/widgets/custom_auth_ques.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:bmi/view/widgets/text_forms/email_text_form.dart';
import 'package:bmi/view/widgets/text_forms/password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static const routeName = '/log_in_page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
          text: 'LOG IN',
          fontSize: 30,
          color: color,
        ),
        SizedBox(
          height: size.height * 0.04,
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
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, ForgetPasswordPage.routeName),
            child: CustomText(
              text: 'Forget Password?',
              textDecoration: TextDecoration.underline,
              fontSize: 20,
              color: color,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CustomButtons(
          colorButton: color,
          textColor: Colors.blue,
          pageTitle: 'LOG IN',
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              authProvider.logInToFirebase(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                  context: context);
            }
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        AuthQuestion(
          question: 'Don`t have an account? ',
          pageTitle: 'Sign up',
          fontSize: 20,
          page: SignUpPage.routeName,
          color: color,
        ),
      ],
    );
  }
}
