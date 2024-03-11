import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_add_activity_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_card.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_plus_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/textform.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

import 'activity_view_controller.dart';

class ActiviteView extends StatefulWidget {
  const ActiviteView({super.key});

  @override
  State<ActiviteView> createState() => _ActiviteViewState();
}

class _ActiviteViewState extends State<ActiviteView> {
  TextEditingController controller = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  ActivityViewController activityController = Get.put(ActivityViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      shrinkWrap: true,
      children: [
        CustomMain(
          text: "Activity Page",
        ),

        //      Obx(() {
        //   return SizedBox(
        //       height: 50,
        //       child: controller.categoryList.isEmpty
        //           ? Text("no medicine")
        //           :
        SizedBox(
          height: screenHeight(2.2),
          child: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: activityController.activityList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        CustomCard(
                          name: activityController.activityList[index].name,
                          details:
                              activityController.activityList[index].details,
                          repeat: activityController.activityList[index].repeat,
                          onTap: showDefaultDialog,
                        )
                      ]));
                }),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
              child: CustomPlusButton(
                widget: CustomAddActivityDialog(),
                text: "add an activity",
              ),
            ),
          ],
        ),
      ],
    ));
  }

  showDefaultDialog() {
    Get.defaultDialog(
        content: Column(
      children: [
        Center(
          child: Text(
            "activity name",
            style: TextStyle(
                color: AppColors.blacktext,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth(20)),
          ),
        ),
        screenHeight(30).ph,
        TextForm(hinttext: ' Activity name', texteditingcontroller: controller),
        screenHeight(40).ph,
        TextForm(
          hinttext: ' Details',
          texteditingcontroller: controller,
          hieght: screenHeight(5),
          maxLine: 6,
        ),
        Row(
          children: [
            CustomText(
              text: "repeat",
              colortext: AppColors.blacktext,
              weigthtext: FontWeight.w400,
            ),
            TextForm(
              hinttext: "",
              texteditingcontroller: repeatController,
            ),
            CustomText(
              text: "per",
              colortext: AppColors.blacktext,
              weigthtext: FontWeight.w400,
            ),
          ],
        )
      ],
    ));
  }
}
