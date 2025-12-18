import 'package:flutter/material.dart';

class ScrollableFillScreen extends StatelessWidget {
  const ScrollableFillScreen({
    super.key,
    EdgeInsets? padding,
    required this.child,
  }) : padding = padding ?? EdgeInsets.zero;

  final EdgeInsets padding;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(padding: padding, child: child),
        ),
      ],
    );
  }
}
