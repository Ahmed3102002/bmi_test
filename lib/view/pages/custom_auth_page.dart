import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAuthPage extends StatelessWidget {
  const CustomAuthPage({
    super.key,
    required this.childern,
    this.appBar,
    required this.formKey,
  });

  final List<Widget> childern;
  final PreferredSizeWidget? appBar;
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Form(
      key: formKey,
      child: Scaffold(
        appBar: appBar,
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.09,
            child: const Center(
              child: CustomText(
                text: 'Fashion Store',
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(size.width * 0.015),
            padding: EdgeInsets.all(size.width * 0.06),
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: childern,
            ),
          ),
        ]),
      ),
    ));
  }
}
