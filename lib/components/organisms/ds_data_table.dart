import 'package:flutter/material.dart';

class DSDataTable extends StatelessWidget {
  final List<String> headers;
  final Map<String, dynamic> data;
  final void Function(String) update;
  final void Function(String) delete;
  const DSDataTable({
    Key? key,
    required this.headers,
    required this.data,
    required this.update,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? _buildEmpty()
        : DataTable(
            columns: [
              // iterate over the keys in the data map with a for loop
              for (final key in headers) DataColumn(label: Text(transformString(key))),
              const DataColumn(label: Text('Actions')),
            ],
            rows: [
              for (final customer in data.entries.toList())
                DataRow(
                  cells: [
                    for (final value in customer.value.entries.toList())
                      DataCell(Text(value.value.toString())),
                    ...[
                      DataCell(
                        _buildActions(context, customer.key),
                      )
                    ]
                  ],
                )
            ],
          );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Text('No data found'),
    );
  }

  Row _buildActions(BuildContext context, String key) {

    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButton(
          onPressed: () => update(key),
          icon: Icon(Icons.edit, color: colors.primary,),
        ),
        IconButton(
          onPressed: () => delete(key),
          icon: Icon(Icons.delete, color: colors.primary,),
        ),
      ],
    );
  }

  String transformString(String input) {
    return input.split('_').map((str) => str[0].toUpperCase() + str.substring(1)).join(' ');
  }
}
