import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class InfoSnackbar extends StatelessWidget {
  const InfoSnackbar({super.key, required this.text, this.theme});

  final String text;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 15, 18, 15),
      decoration: BoxDecoration(
        color: theme?.extension<AppColors>()?.base100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(children: [Expanded(child: Text(text))]),
    );
  }
}
