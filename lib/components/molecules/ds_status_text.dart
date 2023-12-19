import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

  enum StatusTextVariant {
    primary,
    secondary,
    error,
    disabled,
    cancel,
    success
  }

class DsStatusText extends StatelessWidget {

  final String label;
  final StatusTextVariant variant;
  final double? fontSize;

  const DsStatusText({
    super.key, 
    required this.label,
    this.variant = StatusTextVariant.primary,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.cardColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label.toUpperCase(),
          style: selectStatusTextVariant(context).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize
          ),
        )
      ),
    );
  }

  TextStyle selectStatusTextVariant(BuildContext context) {
    switch (variant) {
      case StatusTextVariant.primary:
        return primaryStatusTextStyle(context);
      case StatusTextVariant.secondary:
        return secondaryStatusTextStyle(context);
      case StatusTextVariant.error:
        return errorStatusTextStyle(context);
      case StatusTextVariant.disabled:
        return disabledStatusTextStyle(context);
      case StatusTextVariant.cancel:
        return cancelStatusTextStyle(context);
      case StatusTextVariant.success:
        return successStatusTextStyle(context);
      default:
        return primaryStatusTextStyle(context);
    }
  }

  TextStyle primaryStatusTextStyle(BuildContext context){

    final colors = Theme.of(context).colorScheme;

    return TextStyle(
      color: colors.onSurface,
    );
  }  
  TextStyle secondaryStatusTextStyle(BuildContext context){
    return const TextStyle(
      color: DSColors.secondary
    );
  }  
  TextStyle errorStatusTextStyle(BuildContext context){

    final colors = Theme.of(context).colorScheme;

    return TextStyle(
      color: colors.error
    );
  }
  TextStyle disabledStatusTextStyle(BuildContext context){

    final colors = Theme.of(context);

    return TextStyle(
      color: colors.disabledColor
    );
  }
  TextStyle cancelStatusTextStyle(BuildContext context){

    final colors = Theme.of(context).colorScheme;

    return TextStyle(
      color: colors.onError
    );
  }
  TextStyle successStatusTextStyle(BuildContext context){
    return const TextStyle(
      color: DSColors.success
    );
  }

}