import 'package:bitsgap_test_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconWidget extends StatelessWidget {
  final SvgPicture icon;

  const CustomIconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.irisBlue,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
