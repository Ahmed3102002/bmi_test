import 'package:bmi/firebase_options.dart';
import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/view/pages/add_bmi_page.dart';
import 'package:bmi/view/pages/forget_password_page.dart';
import 'package:bmi/view/pages/home_page.dart';
import 'package:bmi/view/pages/log_in_page.dart';
import 'package:bmi/view/pages/sign_up_page.dart';
import 'package:bmi/view/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserAuthProvider>(
            create: (context) => UserAuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          WelcomePage.routeName: (context) => const WelcomePage(),
          LogInPage.routeName: (context) => const LogInPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          ForgetPasswordPage.routeName: (context) => const ForgetPasswordPage(),
          HomePage.routeName: (context) => const HomePage(),
          AddBMIPage.routeName: (context) => const AddBMIPage(),
        },
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? WelcomePage.routeName
            : HomePage.routeName,
      ),
    );
  }
}
