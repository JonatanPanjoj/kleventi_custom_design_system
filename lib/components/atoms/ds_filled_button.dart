import 'package:flutter/material.dart';

enum FilledButtonSize { small, medium, large }

enum FilledButtonVariant { primary, secondary, error, disabled }

class DsFilledButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final FilledButtonSize size;
  final FilledButtonVariant variant;
  final bool isLoading;

  const DsFilledButton({
    required this.label,
    this.icon,
    this.onPressed,
    this.size = FilledButtonSize.medium,
    this.variant = FilledButtonVariant.primary,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size == FilledButtonSize.small
          ? 32
          : size == FilledButtonSize.medium
              ? 40
              : 48,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: variant == FilledButtonVariant.primary
              ? Theme.of(context).colorScheme.primary
              : variant == FilledButtonVariant.secondary
                  ? Theme.of(context).colorScheme.secondary
                  : variant == FilledButtonVariant.error
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.surface,
        ),
        onPressed: isLoading ? null : onPressed,
        icon: icon == null ? const SizedBox() : Icon(icon),
        label: isLoading ? const CircularProgressIndicator() : Text(label),
      ),
    );
  }
}
