import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import 'package:flutter_templete/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeViewController controller = Get.put(HomeViewController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomMain(
              text: "Home Page",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth(300),
                        height: screenHeight(15),
                        decoration: BoxDecoration(color: AppColors.blacktext),
                      ),
                      screenWidth(25).pw,
                      CustomText(
                        text: "Medicines",
                        weigthtext: FontWeight.w500,
                        fonttext: screenWidth(20),
                      )
                    ],
                  ),
                  screenHeight(30).ph,
                  //      Obx(() {
                  //   return SizedBox(
                  //       height: 50,
                  //       child: controller.categoryList.isEmpty
                  //           ? Text("no medicine")
                  //           :
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.medicineList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: controller.medicineList[index])
                                  ]));
                        }),
                  ),
                  screenHeight(30).ph,
                  Row(
                    children: [
                      Container(
                        width: screenWidth(300),
                        height: screenHeight(15),
                        decoration: BoxDecoration(color: AppColors.blacktext),
                      ),
                      screenWidth(25).pw,
                      CustomText(
                        text: "Activities",
                        weigthtext: FontWeight.w500,
                        fonttext: screenWidth(20),
                      )
                    ],
                  ),
                  screenHeight(30).ph,
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.activityList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: controller.activityList[index])
                                  ]));
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
