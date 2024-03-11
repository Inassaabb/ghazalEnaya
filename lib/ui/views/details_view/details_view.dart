import 'package:flutter/material.dart';

import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/ui/views/details_view/details_view_controller.dart';
import 'package:get/get.dart';

class DetailsView extends StatefulWidget {
  final ProductModel model;
  const DetailsView({super.key, required this.model});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsViewController controller;

  @override
  void initState() {
    controller = Get.put(DetailsViewController(widget.model));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
