import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

enum DsInputType {
  text,
  password,
  email,
  number,
  phone,
  multiline,
  date,
  time,
  dropdown,
  checkbox,
  radio,
  numeric,
}

class DsInput extends StatefulWidget {
  final DsInputType inputType;
  final String label;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final bool showHeader;
  final TextEditingController? controller;

  const DsInput({
    Key? key,
    this.inputType = DsInputType.text,
    required this.label,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.showHeader = true,
    this.controller,
  }) : super(key: key);
  @override
  State<DsInput> createState() => _DsInputState();
}

class _DsInputState extends State<DsInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showHeader) Text(widget.label),
        if (widget.showHeader) const SizedBox(height: DSSpacing.sm),
        DsTextField(
          inputType: widget.inputType,
          label: widget.label,
          controller: widget.controller,
          onChanged: widget.onChanged,
          prefix: widget.prefix,
          suffix: widget.suffix,
        ),
      ],
    );
  }
}
