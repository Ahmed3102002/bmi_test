import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/images/error.json'),
        const CustomText(
          text: 'Some Thing Error \n Try again later',
          color: Colors.blue,
        )
      ],
    );
  }
}
