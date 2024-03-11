import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/textform.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import 'package:get/get.dart';

class CustomAddActivityDialog extends StatefulWidget {
  const CustomAddActivityDialog({super.key});

  @override
  State<CustomAddActivityDialog> createState() =>
      _CustomAddActivityDialogState();
}

class _CustomAddActivityDialogState extends State<CustomAddActivityDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  RxString dropdownValue = ''.obs;
  RxList<String> dropList = ['Daily', 'weekly', 'permonth'].obs;
  RxBool enable = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: screenWidth(1),
          height: screenHeight(1.8),
          child: Column(
            children: [
              TextForm(
                hinttext: ' Activity name',
                texteditingcontroller: nameController,
              ),
              screenHeight(200).ph,
              TextForm(
                hinttext: ' Details',
                texteditingcontroller: detailsController,
                maxLine: 4,
              ),
              screenHeight(90).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: "repeat",
                    weigthtext: FontWeight.w400,
                  ),
                  TextForm(
                    hinttext: "",
                    texteditingcontroller: repeatController,
                    widthContainer: screenWidth(10),
                    heightContainer: screenHeight(30),
                  ),
                  CustomText(
                    text: "per",
                    weigthtext: FontWeight.w400,
                    fonttext: screenWidth(25),
                  ),
                  Container(
                    width: screenWidth(2.5),
                    height: screenHeight(25),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blacktext,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      underline: Container(),
                      icon: Icon(Icons.keyboard_arrow_down),
                      hint: Text(
                        dropdownValue.value != ''
                            ? "${dropdownValue.value}"
                            : "chose a erpeat",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blacktext),
                      ),
                      items: dropList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blacktext),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue.value = newValue!;
                        });
                      },
                    ),
                  )
                ],
              ),
              screenHeight(90).ph,
              Row(
                children: [
                  CupertinoSwitch(
                    activeColor: AppColors.maingreen,
                    trackColor: AppColors.hintFielColor,

                    value: enable.value, // Set the initial value of the switch
                    onChanged: (value) {
                      // Handle switch state changes
                      // 'value' parameter contains the new state of the switch
                      enable.value = value;
                    },
                  ),
                  CustomText(
                    text: "Enable notification",
                  )
                ],
              ),
              screenHeight(60).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonDialog(
                    onPressed: () {},
                    text: 'save',
                    colorSelect: true,
                  ),
                  CustomButtonDialog(
                    text: 'Cancle',
                    onPressed: () {},
                    colorSelect: false,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
