import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/view/pages/custom_auth_page.dart';
import 'package:bmi/view/widgets/custom_auth_button.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:bmi/view/widgets/text_forms/email_text_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  static const routeName = '/forget_password_page';

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
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
      appBar: AppBar(
        foregroundColor: Colors.blue,
      ),
      childern: [
        CustomText(
          text: 'FORGET PASSWORD',
          fontSize: 30,
          color: color,
        ),
        Lottie.asset(
          'assets/images/forget_password.json',
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        EmailTextForm(
            emailController: emailController, emailFocusNode: emailFocusNode),
        SizedBox(
          height: size.height * 0.04,
        ),
        CustomButtons(
          colorButton: color,
          textColor: Colors.blue,
          pageTitle: 'SEND',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              try {
                authProvider.sendPasswordRestEmail(
                    email: emailController.text.trim(), context: context);
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
