import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4286731538),
      surfaceTint: Color(4286731538),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958519),
      onPrimaryContainer: Color(4280948480),
      secondary: Color(4286927639),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294958269),
      onSecondaryContainer: Color(4281079296),
      tertiary: Color(4287058459),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958273),
      onTertiaryContainer: Color(4281210112),
      error: Color(4286532986),
      onError: Color(4294967295),
      errorContainer: Color(4294957046),
      onErrorContainer: Color(4281534515),
      background: Color(4294965492),
      onBackground: Color(4280359443),
      surface: Color(4294965492),
      onSurface: Color(4280359443),
      surfaceVariant: Color(4293976272),
      onSurfaceVariant: Color(4283450681),
      outline: Color(4286739816),
      outlineVariant: Color(4292134069),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741095),
      inverseOnSurface: Color(4294766306),
      inversePrimary: Color(4294425456),
      primaryFixed: Color(4294958519),
      onPrimaryFixed: Color(4280948480),
      primaryFixedDim: Color(4294425456),
      onPrimaryFixedVariant: Color(4284825088),
      secondaryFixed: Color(4294958269),
      onSecondaryFixed: Color(4281079296),
      secondaryFixedDim: Color(4294752628),
      onSecondaryFixedVariant: Color(4285021184),
      tertiaryFixed: Color(4294958273),
      onTertiaryFixed: Color(4281210112),
      tertiaryFixedDim: Color(4294948984),
      onTertiaryFixedVariant: Color(4285217539),
      surfaceDim: Color(4293253324),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963685),
      surfaceContainer: Color(4294569184),
      surfaceContainerHigh: Color(4294174426),
      surfaceContainerHighest: Color(4293845204),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284431104),
      surfaceTint: Color(4286731538),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288375592),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284692736),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288637228),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284888832),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288767791),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284559965),
      onError: Color(4294967295),
      errorContainer: Color(4288177041),
      onErrorContainer: Color(4294967295),
      background: Color(4294965492),
      onBackground: Color(4280359443),
      surface: Color(4294965492),
      onSurface: Color(4280359443),
      surfaceVariant: Color(4293976272),
      onSurfaceVariant: Color(4283187510),
      outline: Color(4285095249),
      outlineVariant: Color(4287002987),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741095),
      inverseOnSurface: Color(4294766306),
      inversePrimary: Color(4294425456),
      primaryFixed: Color(4288375592),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286534416),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288637228),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286730517),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288767791),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286861081),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293253324),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963685),
      surfaceContainer: Color(4294569184),
      surfaceContainerHigh: Color(4294174426),
      surfaceContainerHighest: Color(4293845204),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281539840),
      surfaceTint: Color(4286731538),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284431104),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281670656),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284692736),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281801472),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284888832),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282060858),
      onError: Color(4294967295),
      errorContainer: Color(4284559965),
      onErrorContainer: Color(4294967295),
      background: Color(4294965492),
      onBackground: Color(4280359443),
      surface: Color(4294965492),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293976272),
      onSurfaceVariant: Color(4281016856),
      outline: Color(4283187510),
      outlineVariant: Color(4283187510),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741095),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294961361),
      primaryFixed: Color(4284431104),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282459904),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284692736),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282656000),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284888832),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282786816),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293253324),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963685),
      surfaceContainer: Color(4294569184),
      surfaceContainerHigh: Color(4294174426),
      surfaceContainerHighest: Color(4293845204),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294425456),
      surfaceTint: Color(4294425456),
      onPrimary: Color(4282788352),
      primaryContainer: Color(4284825088),
      onPrimaryContainer: Color(4294958519),
      secondary: Color(4294752628),
      onSecondary: Color(4282984704),
      secondaryContainer: Color(4285021184),
      onSecondaryContainer: Color(4294958269),
      tertiary: Color(4294948984),
      onTertiary: Color(4283180800),
      tertiaryContainer: Color(4285217539),
      onTertiaryContainer: Color(4294958273),
      error: Color(4294030311),
      onError: Color(4283178825),
      errorContainer: Color(4284823137),
      onErrorContainer: Color(4294957046),
      background: Color(4279767564),
      onBackground: Color(4293845204),
      surface: Color(4279767564),
      onSurface: Color(4293845204),
      surfaceVariant: Color(4283450681),
      onSurfaceVariant: Color(4292134069),
      outline: Color(4288450176),
      outlineVariant: Color(4283450681),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845204),
      inverseOnSurface: Color(4281741095),
      inversePrimary: Color(4286731538),
      primaryFixed: Color(4294958519),
      onPrimaryFixed: Color(4280948480),
      primaryFixedDim: Color(4294425456),
      onPrimaryFixedVariant: Color(4284825088),
      secondaryFixed: Color(4294958269),
      onSecondaryFixed: Color(4281079296),
      secondaryFixedDim: Color(4294752628),
      onSecondaryFixedVariant: Color(4285021184),
      tertiaryFixed: Color(4294958273),
      onTertiaryFixed: Color(4281210112),
      tertiaryFixedDim: Color(4294948984),
      onTertiaryFixedVariant: Color(4285217539),
      surfaceDim: Color(4279767564),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359443),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069803),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294754420),
      surfaceTint: Color(4294425456),
      onPrimary: Color(4280488704),
      primaryContainer: Color(4290479681),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294950522),
      onSecondary: Color(4280619520),
      secondaryContainer: Color(4290741317),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950276),
      onTertiary: Color(4280684800),
      tertiaryContainer: Color(4290937672),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294293483),
      onError: Color(4281140013),
      errorContainer: Color(4290150063),
      onErrorContainer: Color(4278190080),
      background: Color(4279767564),
      onBackground: Color(4293845204),
      surface: Color(4279767564),
      onSurface: Color(4294966007),
      surfaceVariant: Color(4283450681),
      onSurfaceVariant: Color(4292397241),
      outline: Color(4289699986),
      outlineVariant: Color(4287529331),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845204),
      inverseOnSurface: Color(4281346337),
      inversePrimary: Color(4284890880),
      primaryFixed: Color(4294958519),
      onPrimaryFixed: Color(4280028672),
      primaryFixedDim: Color(4294425456),
      onPrimaryFixedVariant: Color(4283313920),
      secondaryFixed: Color(4294958269),
      onSecondaryFixed: Color(4280093952),
      secondaryFixedDim: Color(4294752628),
      onSecondaryFixedVariant: Color(4283510272),
      tertiaryFixed: Color(4294958273),
      onTertiaryFixed: Color(4280225024),
      tertiaryFixedDim: Color(4294948984),
      onTertiaryFixedVariant: Color(4283706368),
      surfaceDim: Color(4279767564),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359443),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069803),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294966007),
      surfaceTint: Color(4294425456),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294754420),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294950522),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950276),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965754),
      onError: Color(4278190080),
      errorContainer: Color(4294293483),
      onErrorContainer: Color(4278190080),
      background: Color(4279767564),
      onBackground: Color(4293845204),
      surface: Color(4279767564),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283450681),
      onSurfaceVariant: Color(4294966007),
      outline: Color(4292397241),
      outlineVariant: Color(4292397241),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845204),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4282262528),
      primaryFixed: Color(4294959811),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294754420),
      onPrimaryFixedVariant: Color(4280488704),
      secondaryFixed: Color(4294959816),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294950522),
      onSecondaryFixedVariant: Color(4280619520),
      tertiaryFixed: Color(4294959563),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950276),
      onTertiaryFixedVariant: Color(4280684800),
      surfaceDim: Color(4279767564),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359443),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069803),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
