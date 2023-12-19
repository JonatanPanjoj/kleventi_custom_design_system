import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  final VoidCallback? onTap;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
    this.onTap,
  });
}
