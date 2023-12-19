import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

enum FilledButtonSize { small, medium, large }

enum FilledButtonVariant {
  primary,
  secondary,
  error,
  disabled,
  cancel,
  text,
  success
}

class DsFilledButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final FilledButtonSize size;
  final FilledButtonVariant variant;
  final bool isLoading;
  final bool? isTextBold;
  final double? width;

  const DsFilledButton({
    required this.label,
    this.icon,
    this.onPressed,
    this.size = FilledButtonSize.medium,
    this.variant = FilledButtonVariant.primary,
    this.isLoading = false,
    super.key,
    this.width,
    this.isTextBold,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: size == FilledButtonSize.small
          ? 30
          : size == FilledButtonSize.medium
              ? 50
              : 60,
      child: icon == null
          ? FilledButton(
              style: selectFilledButtonVariant(context),
              onPressed: isLoading ? null : onPressed,
              child: isLoading
                  ? const DSLoading()
                  : Text(
                      label,
                      style: TextStyle(
                        fontSize: size == FilledButtonSize.small
                            ? 12
                            : size == FilledButtonSize.medium
                                ? 14
                                : 16,
                        fontWeight: (isTextBold == null || isTextBold == false)
                            ? null
                            : FontWeight.bold,
                      ),
                    ),
            )
          : FilledButton.icon(
              style: selectFilledButtonVariant(context),
              onPressed: isLoading ? null : onPressed,
              icon: Icon(icon),
              label: isLoading
                  ? const DSLoading()
                  : Text(
                      label,
                      style: TextStyle(
                        fontSize: size == FilledButtonSize.small
                            ? 12
                            : size == FilledButtonSize.medium
                                ? 14
                                : 16,
                        fontWeight: (isTextBold == null || isTextBold == false)
                            ? null
                            : FontWeight.bold,
                      ),
                    ),
            ),
    );
  }

  ButtonStyle selectFilledButtonVariant(BuildContext context) {
    switch (variant) {
      case FilledButtonVariant.primary:
        return primaryButtonStyle();
      case FilledButtonVariant.secondary:
        return secondaryButtonStyle(context);
      case FilledButtonVariant.error:
        return errorButtonStyle(context);
      case FilledButtonVariant.disabled:
        return disabledButtonStyle(context);
      case FilledButtonVariant.cancel:
        return cancelButtonStyle(context);
      case FilledButtonVariant.text:
        return textButtonStyle(context);

      case FilledButtonVariant.success:
        return primaryButtonStyle(
          color: DSColors.success,
        );
      default:
        return primaryButtonStyle();
    }
  }

  ButtonStyle primaryButtonStyle({Color? color}) {
    return FilledButton.styleFrom(
      padding: size == FilledButtonSize.small
          ? const EdgeInsets.symmetric(horizontal: 10)
          : size == FilledButtonSize.medium
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: color ?? DSColors.primary,
    );
  }

  ButtonStyle secondaryButtonStyle(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FilledButton.styleFrom(
      backgroundColor: colors.background,
      foregroundColor: colors.onSurface,
      side: BorderSide(color: colors.onSurface, width: 1),
    );
  }

  ButtonStyle cancelButtonStyle(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).highlightColor,
      foregroundColor: colors.onSurface,
    );
  }

  ButtonStyle textButtonStyle(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FilledButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: colors.onSurface,
    );
  }

  ButtonStyle errorButtonStyle(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FilledButton.styleFrom(backgroundColor: colors.error);
  }

  ButtonStyle disabledButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton.styleFrom(backgroundColor: theme.cardColor);
  }
}
