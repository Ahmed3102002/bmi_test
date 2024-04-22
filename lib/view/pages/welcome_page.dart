import 'package:bmi/view/pages/log_in_page.dart';
import 'package:bmi/view/pages/sign_up_page.dart';
import 'package:bmi/view/widgets/custom_auth_button.dart';
import 'package:bmi/view/widgets/custom_auth_ques.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const routeName = '/welcome_page';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/welcome_image.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                width: size.width * 0.4,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Welcome',
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                width: size.width * 0.52,
                height: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomText(
                    text: 'BMI',
                    color: Colors.blue.withOpacity(0.7),
                    fontSize: 30,
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'Caculater',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 30,
                  ),
                ]),
              ),
              CustomButtons(
                onPressed: () =>
                    Navigator.pushNamed(context, LogInPage.routeName),
                pageTitle: 'Get Started',
                colorButton: Colors.blue.withOpacity(0.7),
                textColor: Colors.white.withOpacity(0.7),
                margin: EdgeInsets.only(
                  top: size.height * 0.25,
                  bottom: size.height * 0.1,
                ),
              ),
              AuthQuestion(
                question: 'Don`t have an account? ',
                pageTitle: 'Sign up',
                color: Colors.white.withOpacity(0.8),
                page: SignUpPage.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
