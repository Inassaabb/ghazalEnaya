import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class MedicinViewController extends BaseController {
  List<CategoryModel> medicinList = [
    CategoryModel(id: 1, details: "bbb", name: "aaa", repeat: "daily"),
    CategoryModel(id: 2, details: "bbb", name: "aaa", repeat: "weekly"),
    CategoryModel(id: 3, details: "bbb", name: "aaa", repeat: "weekly"),
    CategoryModel(id: 4, details: "bbb", name: "aaa", repeat: "per month"),
  ];
}
