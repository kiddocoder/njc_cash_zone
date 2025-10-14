import 'package:flutter/material.dart';

/// ===============================================================
/// GLOBAL APP COLOR CONSTANTS
/// ---------------------------------------------------------------
/// Keep all app-wide color definitions here.
/// Each color is purpose-driven (not just decorative),
/// so they can easily adapt in dark/light themes or branding updates.
/// ===============================================================

///  Accent color — main action color used for buttons, highlights, etc.
const Color accentColor = Color(0xFF65B947);

///  Primary brand color — can be used for headers, gradients, or cards.
const Color primaryColor = Color(0xFFE8C37D);

///  Universal white background color.
const Color whiteColor = Colors.white;

/// Universal black color for text, icons, etc.
const Color blackColor = Colors.black;

///  Error or warning color (used for alerts, failed transactions, etc.)
const Color redColor = Color(0xFFD93A3A);

/// ===============================================================
///  SHADES & MUTED VARIANTS
/// ---------------------------------------------------------------
/// Use these to create subtle UI effects and consistent theming.
/// For example:
/// - light dividers
/// - text secondary tones
/// - backgrounds
/// ===============================================================

/// Accent color at 10% opacity (use for shadows, backgrounds, etc.)
final Color accentLightColor = accentColor.withOpacity(0.1);

/// Black at 10% opacity (use for soft text shadows, muted text, etc.)
final Color blackLightColor = blackColor.withOpacity(0.1);

/// Divider line color (light black tone at 10% opacity)
final Color dividerLight = blackColor.withOpacity(0.1);

/// Muted white at 80% opacity (used for overlay text or subtle backgrounds)
final Color whiteMutedColor = whiteColor.withOpacity(0.8);

/// Neutral Grays
const grayColor = Color(0xFFBDBDBD);
const lightGray = Color(0xFFF5F5F5);
const darkGray = Color(0xFF757575);
