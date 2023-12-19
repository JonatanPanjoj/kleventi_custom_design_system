import 'package:flutter/material.dart';

enum SnackBarStatus {success, error, info}

class DsSnackBar extends SnackBar {
  DsSnackBar({
    super.key, 
    required String message, 
    required SnackBarStatus status, 
    required BuildContext context
  }) : super(
    content: Text(message),
    backgroundColor: _getBackgroundColor(context,status),
    behavior: SnackBarBehavior.floating,
    width: MediaQuery.of(context).size.width * 0.5,
  );

  static Color _getBackgroundColor(BuildContext context, SnackBarStatus status) {
    final colors = Theme.of(context).colorScheme;
    switch (status) {
      case SnackBarStatus.success:
        return colors.primary; // Define el color para el estado 'success'
      case SnackBarStatus.error:
        return colors.error; // Define el color para el estado 'error'
      case SnackBarStatus.info:
        return Colors.blue; // Define el color para el estado 'info'
      default:
        return Colors.grey; // Define un color por defecto
    }
  }
}