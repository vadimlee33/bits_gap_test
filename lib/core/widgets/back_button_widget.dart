import 'package:bitsgap_test_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const ShapeDecoration(
          color: AppColors.whiteSmoke,
          shape: OvalBorder(),
        ),
        child: AppIcons.arrowLeftIcon(),
      ),
    );
  }
}
