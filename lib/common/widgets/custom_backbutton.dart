import 'package:flutter/material.dart';
import 'package:github_app/common/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.func,
  }) : super(key: key);
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        height: 37,
        width: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.brandWhite,
        ),
        child: const Icon(
          Icons.arrow_back_sharp,
          color: AppColors.background,
        ),
      ),
    );
  }
}
