import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DsOrderListCardSkeleton extends StatelessWidget {
  const DsOrderListCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: DSColors.card,
      highlightColor: DSColors.grey100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DSSpacing.md),
                child: Column(
                  children: [
                    const SizedBox(height: DSSpacing.xs),
                    _buildProductCardSkeleton(),
                    const SizedBox(height: DSSpacing.xs),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCardSkeleton() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: DSColors.card,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: DSColors.card,
            ),
          ),
        ],
      ),
    );
  }
}
