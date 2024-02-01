import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool isLoading;
  final VoidCallback? onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    this.isLoading = false,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        DsFilledButton(
          variant: FilledButtonVariant.cancel,
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(),
        ),
        DsFilledButton(
          label: 'Confirm',
          isLoading: isLoading,
          onPressed: onConfirm,
        ),
      ],
    );
  }
}
