import 'package:custom_design_system/components/molecules/ds_text_form_field.dart';
import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class DsTextField extends StatelessWidget {
  final DsInputType inputType;
  final String label;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  // Include other properties as needed

  const DsTextField({
    super.key,
    this.inputType = DsInputType.text,
    required this.label,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.controller,
    // Add other parameters as needed
  });

  @override
  Widget build(BuildContext context) {
    switch (inputType) {
      case DsInputType.password:
        return _buildTextField(context: context, obscureText: true);
      case DsInputType.email:
        return _buildTextField(context: context, keyboardType: TextInputType.emailAddress);
      case DsInputType.number:
      case DsInputType.numeric:
        return _buildTextField(context: context, keyboardType: TextInputType.number);
      case DsInputType.phone:
        return _buildTextField(context: context, keyboardType: TextInputType.phone);
      case DsInputType.multiline:
        return _buildTextField(context: context, maxLines: null);
      case DsInputType.date:
        // You might open a date picker here or handle date input in a specialized way
        return _buildTextField(context: context, ); // Simplified; adjust as per requirements
      case DsInputType.time:
        // You might open a time picker here or handle time input in a specialized way
        return _buildTextField(context: context, ); // Simplified; adjust as per requirements
      // Handle other cases as needed...
      default:
        return _buildTextField(context: context, );
    }
  }

  Widget _buildTextField({
    required BuildContext context,
    bool obscureText = false,
    TextInputType? keyboardType,
    int? maxLines = 1,
    // Include other parameters as needed
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: _inputDecoration(context),
      // Include other TextField properties as needed
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: label,
      // hintStyle: DSTypography.body.copyWith(color: DSColors.textDisabled),
      prefix: prefix,
      suffixIcon: suffix,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DSColors.textDisabled,
          width: 1,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DSColors.textDisabled,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.primary,
          width: 2.0,
        ),
      ),
    );
  }
}
