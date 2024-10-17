import 'package:bitsgap_test_app/presentation/character_detail_page/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationRowWidget extends StatelessWidget {
  final String informationType;
  final String text;
  final SvgPicture icon;
  const InformationRowWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.informationType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CustomIconWidget(icon: icon),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                informationType,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 4),
              Text(text, style: Theme.of(context).textTheme.titleLarge),
            ],
          )
        ],
      ),
    );
  }
}
