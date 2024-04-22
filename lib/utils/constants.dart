import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Constants {
  static SnackBar showMessage(String error) {
    return SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.blue,
      content: CustomText(
        text: error,
        fontSize: 15,
      ),
    );
  }
}
