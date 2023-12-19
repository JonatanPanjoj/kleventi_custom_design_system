import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class DsListTile extends StatelessWidget {
  final String? status;

  const DsListTile({super.key, required this.menuItem, this.status});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Row(
        children: [
          Text(menuItem.title, overflow: TextOverflow.fade,),
          const SizedBox(
            width: DSSpacing.elementGap,
          ),
          status != null
              ? SizedBox(
                  height: 22,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    child: Text(
                      status!,
                      style: TextStyle(color: colors.surface, fontSize: 10),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      subtitle: Text(menuItem.subTitle),
      onTap: menuItem.onTap,
    );
  }
}
