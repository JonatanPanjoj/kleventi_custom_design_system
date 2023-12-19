import 'package:flutter/material.dart';

class DsDropdownButtonFormField extends StatelessWidget {
  final String label;
  final ValueChanged<dynamic> onChanged;
  final dynamic value;
  final List<DropdownMenuItem<Object>>? items;

  const DsDropdownButtonFormField({
    super.key, 
    required this.label,
    required this.onChanged, 
    required this.value, 
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10,),
        DropdownButtonFormField(
          value: value,
          onChanged: onChanged,
          items: items
        ),
      ],
    );
  }
}