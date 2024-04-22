class BMIMethods {
  static String getBmiCategory(double bmi) {
    String bmiCase;
    switch (bmi) {
      case double.nan:
        bmiCase = 'Not a Number';
        break;
      case double.negativeInfinity:
      case double.infinity:
        bmiCase = 'Out of Range';
        break;
      default:
        if (bmi < 18.5) {
          bmiCase = 'Under weight';
        } else if (bmi >= 18.5 && bmi < 25) {
          bmiCase = 'Normal weight';
        } else if (bmi >= 25 && bmi < 30) {
          bmiCase = 'Over weight';
        } else if (bmi >= 30 && bmi < 35) {
          bmiCase = 'Obesity Class I';
        } else if (bmi >= 35 && bmi < 40) {
          bmiCase = 'Obesity Class II';
        } else {
          bmiCase = 'Obesity Class III';
        }
        break;
    }
    return bmiCase;
  }
}
