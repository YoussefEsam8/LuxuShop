import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color primaryBlack = Color(0xFF111111);
  static const Color secondaryBlack = Color(0xFF1C1C1E);
  static const Color lightGrey = Color(0xFFF5F5F7);

  // بناء الثيم الفاتح النظيف للتطبيق
  static ThemeData ligtTheme = ThemeData(
    brightness: Brightness.light, // ثابتين على الفاتح
    primaryColor: primaryGold,
    scaffoldBackgroundColor: lightGrey, // الخلفية رمادي فاتح مريحة جداً
    // الـ ColorScheme الفاتح الصح بدون تضارب
    colorScheme: const ColorScheme.light(
      primary: primaryGold,
      surface: Colors.white, // البطاقات والـ Containers البيضاء
      background: lightGrey,
    ),

    // تنسيق الخطوط بوضوح باللون الأسود عشان تبان
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryBlack,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: primaryBlack),
      bodyMedium: TextStyle(fontSize: 14, color: secondaryBlack),
    ),

    // تنسيق الزرار الأسود الفخم
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlack, // الزرار أسود بالكامل
        foregroundColor: Colors.white, // النص جوة الزرار رمادي فاتح ناصع
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  );
}
