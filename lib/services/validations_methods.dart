class ValidatorMethods {
  static const namePattern = r'^[a-z A-Z]+$';
  static const emailPattern =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  static String? validationOfName(value) {
    if (value.toString().length <= 2 ||
        !RegExp(namePattern).hasMatch(value) ||
        value.toString().isEmpty) {
      return 'Enter valid name';
    } else {
      return null;
    }
  }

  static String? validationOfEmail(value) {
    if (!RegExp(emailPattern).hasMatch(value) || value.toString().isEmpty) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? validationOfPassword(value) {
    if (value.toString().length < 8 || value.toString().isEmpty) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }

  static String? validationOfage(value) {
    if (value.toString().length < 2 ||
        value.toString().isEmpty ||
        int.parse(value.toString()) > 100) {
      return 'Enter valid age';
    } else {
      return null;
    }
  }

  static String? validationOfHeight(value) {
    if (value.toString().length < 3 ||
        value.toString().isEmpty ||
        int.parse(value.toString()) > 150) {
      return 'Enter valid height';
    } else {
      return null;
    }
  }

  static String? validationWeight(value) {
    if (value.toString().length < 2 ||
        value.toString().isEmpty ||
        int.parse(value.toString()) > 50) {
      return 'Enter valid weight';
    } else {
      return null;
    }
  }
}
