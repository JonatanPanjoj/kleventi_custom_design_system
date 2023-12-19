import 'package:flutter/material.dart';

class DsBottomCard extends StatelessWidget {

  final Widget child;
  final double? width;

  const DsBottomCard({
    super.key, 
    required this.child,
    this.width
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Container(
        width: width,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: child
        ),
      );
  }
}