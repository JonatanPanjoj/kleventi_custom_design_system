import 'package:flutter/material.dart';

class DsDatePicker extends StatefulWidget {
  final String label;
  final DateTime date;
  final ValueChanged<DateTime> onDateChanged; // Añade un callback

  const DsDatePicker({
    Key? key, 
    required this.label, 
    required this.date,
    required this.onDateChanged, // Asegúrate de pasar el callback cuando creas el widget
  }) : super(key: key);

  @override
  State<DsDatePicker> createState() => _DsDatePickerState();
}

class _DsDatePickerState extends State<DsDatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label),
        const SizedBox(height: 10,),
        TextButton(
          child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
          onPressed: () async {
            final DateTime? newDate = await showDatePicker(
              context: context, 
              initialDate: selectedDate, 
              firstDate: DateTime(1980), 
              lastDate: DateTime(2100)
            );
            if (newDate != null) {
              setState(() {
                selectedDate = newDate;
              });
              widget.onDateChanged(newDate); // Llama al callback con la nueva fecha
            }
          }, 
        )
      ],
    );
  }
}
