import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class TitledTextWidget extends StatelessWidget {
  const TitledTextWidget({
    super.key,
    required this.title,
    required this.label,
  });

  final String title;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: theme.extension<AppColors>()?.base500,
            fontWeight: FontWeight.w400,
            height: 1,
          ).def(),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            label ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ).def(),
          ),
        ),
      ],
    );
  }
}
