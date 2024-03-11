import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_activity.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_medicins.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomeViewController extends BaseController {
  RxList<String> categoryList = <String>[].obs;
  List medicineList = [
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
  ];
  List activityList = [
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
  ];

  RxInt selectedIndex = 0.obs;

  RxDouble rating = 0.0.obs;
  @override
  void onInit() {
    // getAllGategory();

    super.onInit();
  }

  // void getAllGategory() {
  //   runLoadingFutureFunction(
  //       operationType: OperationType.CATEGORY,
  //       function: CategoryRepository().getAll().then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(
  //               message: l, messagetype: MessagType.REJECTED);
  //         }, (r) {
  //           categoryList.addAll(r);
  //         });
  //       }));
  // }
}
