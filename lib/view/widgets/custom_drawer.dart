import 'package:bmi/providers/auth_provider.dart';
import 'package:bmi/services/firebase_methods/firebase_auth_methods.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final UserAuthProvider authProvider =
        Provider.of<UserAuthProvider>(context);
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: UserInfoMethods.userInfo.name),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomText(text: UserInfoMethods.userInfo.email),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomText(text: UserInfoMethods.userInfo.age.toString()),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ListTile(
            onTap: () {
              authProvider.logOutToFirebase(context: context);
            },
            title: const CustomText(
              text: 'Log Out',
              color: Colors.blue,
            ),
            trailing: const Icon(
              Icons.logout_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
