class DSSpacing {
  DSSpacing._(); // This prevents instantiation of the class

  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  static const double textGap = 12.0;
  static const double elementGap = 16.0;
  static const double sectionGap = 32.0;

  static const double base = 4.0;

  static double scale(double factor) => base * factor;
}
