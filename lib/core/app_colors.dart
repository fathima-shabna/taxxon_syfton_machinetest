import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF00629F);
  
  // VAT Summary Cards (Backdrops with ~90% opacity as requested)
  static const Color inputVatCard = Color(0xE5FCEBEB);
  static const Color outputVatCard = Color(0xE5E6FAE5);
  static const Color vatPayableCard = Color(0xE5E3F6F8);
  
  static const Color inputVatAmount = Color(0xFFBC4141);
  static const Color outputVatAmount = Color(0xFF3D9646);
  static const Color vatPayableAmount = Color(0xFF3687AC);

  static const Color inputVatSubtitle = Color(0xFFC75B5B);
  static const Color outputVatSubtitle = Color(0xFF5AA161);
  static const Color vatPayableSubtitle = Color(0xFF6A9DB5);
  
  // Action Buttons
  static const Color purchaseExpenseCard = Color(0xFFBC4343);
  static const Color salesCard = Color(0xFF55B54D);
  
  // Transaction List amount colors
  static const Color amountGreen = Color(0xFF3D9646);
  static const Color amountRed = Color(0xFFBC4141);

  // Transaction List background colors (Light versions for red/green rows)
  static const Color expenseBg = Color(0xFFFCEBEB); // Matches inputVatCard without opacity
  static const Color salesBg = Color(0xFFE6FAE5);   // Matches outputVatCard without opacity
  
  // General colors
  static const Color filterSectionBg = Color(0xFFF3F3F3);
  static const Color borderGrey = Color(0xFFE0E0E0); // Colors.grey[300]
  static const Color lightBorder = Color(0xFFE5E9EB);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;
}
