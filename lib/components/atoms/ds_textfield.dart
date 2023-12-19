import 'package:custom_design_system/components/molecules/ds_text_form_field.dart';
import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class DsTextField extends StatelessWidget {
  final DsInputType inputType;
  final String label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? obscureText;
  // Include other properties as needed

  const DsTextField({
    super.key,
    this.inputType = DsInputType.text,
    required this.label,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.controller,
    this.readOnly, 
    this.validator, 
    this.obscureText
    // Add other parameters as needed
  });

  @override
  Widget build(BuildContext context) {
    switch (inputType) {
      case DsInputType.password:
        return _buildTextField(context: context, obscureText: obscureText ?? true);
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
    return TextFormField(
      validator: validator,
      readOnly: readOnly ?? false,
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

    return InputDecoration(
      hintText: label,
      prefix: prefix,
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      ),
      filled: true,
      fillColor: DSColors.card,
    );
  }
}
