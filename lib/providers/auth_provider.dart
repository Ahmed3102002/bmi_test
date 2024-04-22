import 'package:bmi/services/firebase_methods/firebase_auth_methods.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/view/pages/home_page.dart';
import 'package:bmi/view/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthProvider with ChangeNotifier {
  bool isVisiable = false;
  bool get getIsVisiable => isVisiable;
  void get setIsVisible {
    isVisiable = !isVisiable;
    notifyListeners();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void signUpToFirebase({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
    required int age,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
      if (context.mounted) {
        UserInfoMethods.setUserInfo(
            name: name, email: email, age: age, context: context);
      }
      notifyListeners();
      UserInfoMethods.getUserInfo();
      notifyListeners();
      setIsVisible;
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'weak-password') {
        message = 'Your password is so weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'This account is already used';
      } else {
        message = title;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(message),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(error.toString()),
        );
      }
    }
  }

  void logInToFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      UserInfoMethods.getUserInfo();
      notifyListeners();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'user-not-found') {
        message = 'email not found';
      } else if (error.code == 'wrong-password') {
        message = 'Password isn`t correct';
      } else {
        message = title;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(message),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(error.toString()),
        );
      }
    }
  }

  void sendPasswordRestEmail(
      {required String email, required BuildContext context}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      notifyListeners();
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'user-not-found') {
        message = 'email not found';
      } else if (error.code == 'wrong-password') {
        message = 'Password isn`t correct';
      } else {
        message = title;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(message),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(error.toString()),
        );
      }
    }
  }

  void logOutToFirebase({required BuildContext context}) async {
    try {
      await auth.signOut();
      notifyListeners();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, WelcomePage.routeName);
      }
    } on FirebaseAuthException catch (error) {
      final String title = error.code.replaceAll(RegExp('-'), ' ');
      String message;
      if (error.code == 'weak-password') {
        message = 'Your password is so weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'This account is already used';
      } else {
        message = title;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(message),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          Constants.showMessage(error.toString()),
        );
      }
    }
  }
}
