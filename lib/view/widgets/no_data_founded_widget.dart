import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataFounded extends StatelessWidget {
  const NoDataFounded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/images/no_data.json'),
        const CustomText(
          text: 'No Data Yet \n Add Your BMI',
          color: Colors.blue,
        )
      ],
    );
  }
}
