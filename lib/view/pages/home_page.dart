import 'package:bmi/services/bmi_method.dart';
import 'package:bmi/services/firebase_methods/firebase_auth_methods.dart';
import 'package:bmi/view/pages/add_bmi_page.dart';
import 'package:bmi/view/widgets/custom_drawer.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:bmi/view/widgets/error_widget.dart';
import 'package:bmi/view/widgets/loading_widget.dart';
import 'package:bmi/view/widgets/no_data_founded_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home_page';

  final double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    var uid2 = FirebaseAuth.instance.currentUser!.uid;
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const CustomText(
            text: 'BMI CALCULATOR',
          ),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AddBMIPage.routeName),
                icon: const Icon(Icons.add))
          ],
        ),
        drawer: const CustomDrawerWidget(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('all_calculations')
              .doc(uid2)
              .collection('calculation')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting &&
                !snapshots.hasData) {
              return const LoadingWidget();
            }
            if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
              return const NoDataFounded();
            }
            if (snapshots.hasError) {
              return const CustomErrorWidget();
            }

            var docs2 = snapshots.data!.docs;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                docs2.where((e) => e['userId'] == uid2).take(10).toList();
            if (data.isEmpty) {
              return const NoDataFounded();
            } else {
              return ListView(children: [
                ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        index == 0
                            ? Column(
                                children: [
                                  CustomText(
                                    text:
                                        'BMI = ${data[0]['bmi'].toStringAsFixed(2)}',
                                    color: Colors.blue,
                                    fontSize: 30,
                                  ),
                                  CustomText(
                                    text: BMIMethods.getBmiCategory(
                                        data[0]['bmi']),
                                    fontSize: 30,
                                    color: Colors.blue,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      text:
                                          "Weight: ${data[index]['weight'].toString()}",
                                      fontSize: fontSize,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    CustomText(
                                      text:
                                          "Height: ${data[index]['height'].toString()}",
                                      fontSize: fontSize,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                      text:
                                          "Age: ${data[index]['age'].toString()}",
                                      fontSize: fontSize,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    CustomText(
                                      text:
                                          "BMI: ${data[index]['bmi'].toStringAsFixed(2)}",
                                      fontSize: fontSize,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await UserInfoMethods.deleteCalculation(
                                        calculationId: data[index].id);
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ]);
            }
          },
        ),
      ),
    );
  }
}
