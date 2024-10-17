import 'package:bitsgap_test_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_icons.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const FavoriteButtonWidget(
      {super.key, required this.isFavorite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        decoration: const ShapeDecoration(
          color: AppColors.whiteSmoke,
          shape: OvalBorder(),
        ),
        child: Center(
          child: InkWell(
              onTap: onTap,
              child:
                  isFavorite ? AppIcons.likedIcon() : AppIcons.unlikedIcon()),
        ));
  }
}
