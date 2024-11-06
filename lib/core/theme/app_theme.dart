import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

final lightTokens = MoonTokens.light.copyWith(
    colors: MoonColors.light.copyWith(),
    typography: MoonTypography.typography.copyWith(
      heading: MoonTypography.typography.heading.apply(
        fontFamily: "DMSans",
        fontWeightDelta: -1,
        fontVariations: [const FontVariation('wght', 500)],
      ),
      body: MoonTypography.typography.body.apply(
        fontFamily: "DMSans",
      ),
    )
);

final ThemeData lightMoon = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xFFF6F7F9),
  primaryColor: MoonColors.light.zeno,
  extensions: <ThemeExtension<dynamic>>[
    MoonTheme(
        tokens: lightTokens,
    ),
  ],
);

final ThemeData darkMoon = ThemeData.dark().copyWith(
  primaryColor: MoonColors.dark.zeno,
  scaffoldBackgroundColor: const Color(0xFF1F1F1F),
  extensions: <ThemeExtension<dynamic>>[
    MoonTheme(
      tokens: MoonTokens.dark.copyWith(
        colors: mdsDarkColors,
        typography: MoonTypography.typography.copyWith(
          heading: MoonTypography.typography.heading.apply(
            fontFamily: "DMSans",
            fontWeightDelta: -1,
            fontVariations: [const FontVariation('wght', 500)],
          ),
          body: MoonTypography.typography.body.apply(
            fontFamily: "DMSans",
          ),
        ),
      ),
    ),
  ],
);
