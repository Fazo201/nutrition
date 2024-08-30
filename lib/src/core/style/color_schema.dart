import "package:flutter/material.dart" show ColorScheme, Brightness, Color;

const ColorScheme lightColorScheme = ColorScheme(

  brightness: Brightness.light,

  primary: Color.fromRGBO(18, 149, 117, 1), ///129575 For main components on UI!
  onPrimary: Color(0xFFFFFFFF), ///FFFFFF For items ex. icons, texts on main components on UI!
  primaryContainer: Color.fromRGBO(219, 235, 231, 1),
  primaryFixedDim: Color.fromRGBO(113, 177, 161, 1),
  primaryFixed: Color.fromRGBO(113, 177, 161, 1),
  secondary: Color(0xFFFF9C00), ///FF9C00
  secondaryContainer: Color(0xFFFFAD30), ///FFAD30
  surface: Color(0xFFFFFFFF), ///FFFFFF For backgrounds of (Scaffold, app, ...).
  surfaceDim: Color(0xFF000000), ///000000 Always darkest at the dark and light mode!
  onSurface: Color.fromRGBO(18, 18, 18, 1), ///121212 For items on background!
  surfaceBright: Color.fromRGBO(217, 217, 217, 1), ///D9D9D9
  onSurfaceVariant: Color.fromRGBO(169, 169, 169, 1),
  outline: Color(0xFFD9D9D9), ///D9D9D9 For outlines!
  errorContainer: Color(0xFFFFE1E7),
  onErrorContainer: Color(0xFFFD3654),
  inverseSurface: Color.fromRGBO(0, 0, 0, 1), /// When components take up like popups or dropdowns!
  shadow: Color.fromRGBO(105, 105, 105, 0.1), /// For shadows

  ///Don't need ones!!!
  onSecondary: Color(0xFF000000),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // secondaryContainer: Color(0xffffffff),
  // onSecondaryContainer: Color(0xff141414),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff000000),
  // tertiaryContainer: Color(0xffEDEDED),
  // onTertiaryContainer: Color(0xff141413),
  // onPrimaryContainer: Color(0xff141311),
  // surfaceContainerHighest: Color(0xffeee8e3),
  // outline: Color(0xff837676),
  // outlineVariant: Color(0xffccc6c6),
  // shadow: Color(0xff000000),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xff171411),
  // onInverseSurface: Color(0xfff5f5f5),
  // inversePrimary: Color(0xfffff8c0),
  // surfaceTint: Color(0xff3F3F3F),
);

const ColorScheme darkColorScheme = ColorScheme(

  brightness: Brightness.dark,

  primary: Color(0xFF2ec866), ///2ec866 For main components on UI!
  onPrimary: Color(0xFF121418), ///121418 For items ex. icons, texts on main components on UI!
  primaryContainer: Color(0xFF00cc90),
  primaryFixedDim: Color(0xFF00be3a),
  primaryFixed: Color(0xFF25d28b),
  secondary: Color(0xFFa47618), ///a47618
  secondaryContainer: Color(0xFFFFAD30), ///FFAD30
  surface: Color(0xFF1e2227), ///121418 For backgrounds of (Scaffold, app, ...).
  onSurface: Color(0xffeceded),
  surfaceDim: Color(0xFFF5F5F5),
  surfaceBright: Color(0xFFf3f9f9),
  onSurfaceVariant: Color.fromRGBO(169, 169, 169, 1),
  inverseSurface: Color.fromRGBO(0, 0, 0, 1),
  shadow: Color(0xFFF5F5F5), /// For all shadows.
  outline: Color(0xFF30363d),
  errorContainer: Color(0xFFFFE1E7),
  onErrorContainer: Color(0xFFFD3654),

  ///Don't need ones!!!
  onSecondary: Color(0xff141210),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // secondaryContainer: Color(0xff6C7882),
  // onSecondaryContainer: Color(0xfff3e6e2),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff131414),
  // primaryContainer: Color(0xff141311),
  // tertiaryContainer: Color(0xff6C7882),
  // onTertiaryContainer: Color(0xffeaf7fb),
  // errorContainer: Color(0xffb1384e),
  // onPrimaryContainer: Color(0xffe9ecf1),
  // onErrorContainer: Color(0xfffbe8ec),
  // surfaceContainerHighest: Color(0xff3d4146),
  // onSurfaceVariant: Color(0xffe0e1e1),
  // outline: Color(0xff767d7d),
  // outlineVariant: Color(0xff2c2e2e),
  // shadow: Color(0xff000000),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xfffafcff),
  // onInverseSurface: Color(0xff131314),
  // inversePrimary: Color(0xff536577),
  // surfaceTint: Color(0xffffffff),
);
