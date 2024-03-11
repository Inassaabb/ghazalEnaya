import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_add_midicine_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_card.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_plus_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/medicine_view/medicine_view_controller.dart';

import 'package:get/get.dart';

class MedicineView extends StatefulWidget {
  const MedicineView({super.key});

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  MedicinViewController medicinController = Get.put(MedicinViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        CustomMain(
          text: "Medicine page",
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
                itemCount: medicinController.medicinList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        CustomCard(
                          name: medicinController.medicinList[index].name,
                          details: medicinController.medicinList[index].details,
                          repeat: medicinController.medicinList[index].repeat,
                          // onTap: showDefaultDialog,
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
                widget: CustomAddMidicineDialog(),
                text: "add an midicine",
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
