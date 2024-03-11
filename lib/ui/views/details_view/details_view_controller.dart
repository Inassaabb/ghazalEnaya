import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class DetailsViewController extends BaseController {
  DetailsViewController(ProductModel mealmodel) {
    model = mealmodel;
  }
  ProductModel model = ProductModel();
}
