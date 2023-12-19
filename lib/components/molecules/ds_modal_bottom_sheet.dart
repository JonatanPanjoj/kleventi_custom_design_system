import 'package:flutter/material.dart';

void showDsModalBottomSheet(
    {required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: child,
        ),
      );
    },
  );
}
