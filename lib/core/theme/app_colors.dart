import 'package:flutter/material.dart';

/// "The Celestial Ledger" Design System — Color Tokens
///
/// Palette rooted in the deep void of space, punctuated by
/// the vibrant energy of distant nebulae.
class AppColors {
  AppColors._();

  // ─── Background & Core Surface ("The Void") ───
  static const Color background = Color(0xFF10131A);
  static const Color surface = Color(0xFF161922);
  static const Color surfaceContainerLowest = Color(0xFF1A1D27);
  static const Color surfaceContainerLow = Color(0xFF1E2230);
  static const Color surfaceContainer = Color(0xFF232839);
  static const Color surfaceContainerHigh = Color(0xFF2A3044);
  static const Color surfaceContainerHighest = Color(0xFF333A50);
  static const Color surfaceVariant = Color(0xFF2E334A);

  // ─── Primary Accents (The Core Engine — Purple) ───
  static const Color primary = Color(0xFFCDBDFF);
  static const Color primaryContainer = Color(0xFF5D21DF);
  static const Color onPrimary = Color(0xFF1A1A2E);
  static const Color primaryDim = Color(0xFF9B85E3);

  // ─── Secondary Accents (Utility — Electric Cyan) ───
  static const Color secondary = Color(0xFFBDF4FF);
  static const Color secondaryContainer = Color(0xFF004D57);
  static const Color secondaryFixedDim = Color(0xFF00DAF3);
  static const Color onSecondary = Color(0xFF003640);

  // ─── Tertiary (High-Energy — Lime) ───
  static const Color tertiary = Color(0xFFA0D800);
  static const Color tertiaryContainer = Color(0xFF3D5200);
  static const Color onTertiary = Color(0xFF1A2E00);

  // ─── Error / Negative ───
  static const Color error = Color(0xFFFFB4AB);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onError = Color(0xFF690005);

  // ─── Text / On-Surface ───
  static const Color onSurface = Color(0xFFE6E1E5);
  static const Color onSurfaceVariant = Color(0xFFC4C0C9);
  static const Color onSurfaceMuted = Color(0xFF8A8693);

  // ─── Outlines & Borders ───
  static const Color outline = Color(0xFF49454F);
  static const Color outlineVariant = Color(0xFF49454F); // use at 15% opacity
  static const Color ghostBorder = Color(0x2649454F); // 15% opacity built-in

  // ─── White / Black references ───
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ─── Gradient Helpers ───
  /// Primary CTA gradient: primary → primaryContainer at 135°
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryContainer],
  );

  /// Glassmorphism overlay for floating elements
  static Color glassOverlay = surfaceVariant.withValues(alpha: 0.6);
}
