import 'package:bmi/services/firebase_methods/firebase_auth_methods.dart';
import 'package:bmi/services/validations_methods.dart';
import 'package:bmi/view/widgets/custom_auth_button.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:bmi/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';

class AddBMIPage extends StatefulWidget {
  const AddBMIPage({super.key});
  static const routeName = '/add_bmi_page';

  @override
  State<AddBMIPage> createState() => _AddBMIPageState();
}

class _AddBMIPageState extends State<AddBMIPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _heightFocusNode.dispose();
    _weightFocusNode.dispose();
    _ageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const CustomText(
            text: 'Add New BMI Calculation',
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02, vertical: size.height * 0.2),
          children: [
            CustomTextForm(
              nextFocusNode: _weightFocusNode,
              validator: ValidatorMethods.validationOfHeight,
              controller: _heightController,
              focusNode: _heightFocusNode,
              keyboardType: TextInputType.number,
              hintText: 'Enter your height',
              prefixIconData: Icons.person,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextForm(
              nextFocusNode: _ageFocusNode,
              validator: ValidatorMethods.validationWeight,
              controller: _weightController,
              focusNode: _weightFocusNode,
              keyboardType: TextInputType.number,
              hintText: 'Enter your weight',
              prefixIconData: Icons.person,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextForm(
              validator: ValidatorMethods.validationOfage,
              controller: _ageController,
              focusNode: _ageFocusNode,
              keyboardType: TextInputType.number,
              hintText: 'Enter your age',
              prefixIconData: Icons.person,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButtons(
              textColor: Colors.white,
              colorButton: Colors.blue,
              pageTitle: 'Add BMI',
              onPressed: () async {
                UserInfoMethods.setCalculation(
                    height: double.parse(_heightController.text.trim()),
                    weight: double.parse(_weightController.text.trim()),
                    age: int.parse(_ageController.text.trim()),
                    context: context);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
