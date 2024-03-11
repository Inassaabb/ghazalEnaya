import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomContainerBloc extends StatefulWidget {
  const CustomContainerBloc({super.key, this.imagename, this.name});

  final String? imagename;
  final String? name;
  @override
  State<CustomContainerBloc> createState() => _CustomContainerBlocState();
}

class _CustomContainerBlocState extends State<CustomContainerBloc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(4.5),
      width: screenWidth(2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.maingreen, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/${widget.imagename}.svg',
            height: screenHeight(6),
          ),
          CustomText(
            text: "${widget.name}",
            fonttext: screenWidth(25),
          )
        ],
      ),
    );
  }
}
