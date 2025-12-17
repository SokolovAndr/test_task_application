import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class TitledFieldBlock extends StatelessWidget {
  const TitledFieldBlock({
    super.key,
    required this.title,
    this.subtitle,
    this.isRequired = false,
    required this.child,
    this.titleStyle,
    this.headerTrailing,
    this.spaceBetweenTopTitle = 8,
  });

  final String title;
  final String? subtitle;
  final bool isRequired;
  final Widget child;
  final TextStyle? titleStyle;
  final Widget? headerTrailing;
  final double spaceBetweenTopTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: title),
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: theme.colorScheme.error).def(),
                    ),
                ],
              ),
              style: titleStyle,
            ),
            const Spacer(),
            if (headerTrailing != null) headerTrailing!,
          ],
        ),
        if (subtitle != null)
          Column(
            children: [
              const SizedBox(height: 1),
              Text(
                subtitle!,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
            ],
          ),
        SizedBox(height: spaceBetweenTopTitle),
        child,
      ],
    );
  }
}
