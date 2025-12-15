import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.baseWhite,
    required this.baseGreen,
    required this.base0,
    required this.base10,
    required this.base100,
    required this.base200,
    required this.base300,
    required this.base400,
    required this.base500,
    required this.base600,
    required this.base700,
    required this.base800,
    required this.base900,
    required this.base970,
    required this.primary20,
    required this.primary40,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    required this.success40,
    required this.success100,
    required this.success200,
    required this.success300,
    required this.success400,
    required this.success500,
    required this.success550,
    required this.success600,
    required this.success700,
    required this.success800,
    required this.success900,
    required this.warning40,
    required this.warning50,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.warning500,
    required this.warning550,
    required this.warning600,
    required this.warning700,
    required this.warning800,
    required this.warning900,
    required this.danger40,
    required this.danger100,
    required this.danger200,
    required this.danger300,
    required this.danger400,
    required this.danger500,
    required this.danger550,
    required this.danger600,
    required this.danger700,
    required this.danger800,
    required this.danger900,
  });

  final Color? baseWhite;
  final Color? baseGreen;
  final Color? base0;
  final Color? base10;
  final Color? base100;
  final Color? base200;
  final Color? base300;
  final Color? base400;
  final Color? base500;
  final Color? base600;
  final Color? base700;
  final Color? base800;
  final Color? base900;
  final Color? base970;
  final Color? primary20;
  final Color? primary40;
  final Color? primary100;
  final Color? primary200;
  final Color? primary300;
  final Color? primary400;
  final Color? primary500;
  final Color? primary600;
  final Color? primary700;
  final Color? primary800;
  final Color? primary900;
  final Color? success40;
  final Color? success100;
  final Color? success200;
  final Color? success300;
  final Color? success400;
  final Color? success500;
  final Color? success550;
  final Color? success600;
  final Color? success700;
  final Color? success800;
  final Color? success900;
  final Color? warning40;
  final Color? warning50;
  final Color? warning100;
  final Color? warning200;
  final Color? warning300;
  final Color? warning400;
  final Color? warning500;
  final Color? warning550;
  final Color? warning600;
  final Color? warning700;
  final Color? warning800;
  final Color? warning900;
  final Color? danger40;
  final Color? danger100;
  final Color? danger200;
  final Color? danger300;
  final Color? danger400;
  final Color? danger500;
  final Color? danger550;
  final Color? danger600;
  final Color? danger700;
  final Color? danger800;
  final Color? danger900;

  @override
  AppColors copyWith({
    Color? baseWhite,
    Color? baseGreen,
    Color? base0,
    Color? base10,
    Color? base100,
    Color? base200,
    Color? base300,
    Color? base400,
    Color? base500,
    Color? base600,
    Color? base700,
    Color? base800,
    Color? base900,
    Color? base970,
    Color? primary20,
    Color? primary40,
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? primary800,
    Color? primary900,
    Color? success40,
    Color? success100,
    Color? success200,
    Color? success300,
    Color? success400,
    Color? success500,
    Color? success550,
    Color? success600,
    Color? success700,
    Color? success800,
    Color? success900,
    Color? warning40,
    Color? warning50,
    Color? warning100,
    Color? warning200,
    Color? warning300,
    Color? warning400,
    Color? warning500,
    Color? warning550,
    Color? warning600,
    Color? warning700,
    Color? warning800,
    Color? warning900,
    Color? danger40,
    Color? danger100,
    Color? danger200,
    Color? danger300,
    Color? danger400,
    Color? danger500,
    Color? danger550,
    Color? danger600,
    Color? danger700,
    Color? danger800,
    Color? danger900,
  }) {
    return AppColors(
      baseWhite: baseWhite ?? this.baseWhite,
      baseGreen: baseGreen ?? this.baseGreen,
      base0: base0 ?? this.base0,
      base10: base10 ?? this.base10,
      base100: base100 ?? this.base100,
      base200: base200 ?? this.base200,
      base300: base300 ?? this.base300,
      base400: base400 ?? this.base400,
      base500: base500 ?? this.base500,
      base600: base600 ?? this.base600,
      base700: base700 ?? this.base700,
      base800: base800 ?? this.base800,
      base900: base900 ?? this.base900,
      base970: base970 ?? this.base970,
      primary20: primary20 ?? this.primary20,
      primary40: primary40 ?? this.primary40,
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      primary800: primary800 ?? this.primary800,
      primary900: primary900 ?? this.primary900,
      success40: success40 ?? this.success40,
      success100: success100 ?? this.success100,
      success200: success200 ?? this.success200,
      success300: success300 ?? this.success300,
      success400: success400 ?? this.success400,
      success500: success500 ?? this.success500,
      success550: success550 ?? this.success550,
      success600: success600 ?? this.success600,
      success700: success700 ?? this.success700,
      success800: success800 ?? this.success800,
      success900: success900 ?? this.success900,
      warning40: warning40 ?? this.success900,
      warning50: warning50 ?? this.warning50,
      warning100: warning100 ?? this.warning100,
      warning200: warning200 ?? this.warning200,
      warning300: warning300 ?? this.warning300,
      warning400: warning400 ?? this.warning400,
      warning500: warning500 ?? this.warning500,
      warning550: warning550 ?? this.warning550,
      warning600: warning600 ?? this.warning600,
      warning700: warning700 ?? this.warning700,
      warning800: warning800 ?? this.warning800,
      warning900: warning900 ?? this.warning900,
      danger40: danger40 ?? this.danger40,
      danger100: danger100 ?? this.danger100,
      danger200: danger200 ?? this.danger200,
      danger300: danger300 ?? this.danger300,
      danger400: danger400 ?? this.danger400,
      danger500: danger500 ?? this.danger500,
      danger550: danger550 ?? this.danger550,
      danger600: danger600 ?? this.danger600,
      danger700: danger700 ?? this.danger700,
      danger800: danger800 ?? this.danger800,
      danger900: danger900 ?? this.danger900,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      baseWhite: Color.lerp(baseWhite, other.baseWhite, t),
      baseGreen: Color.lerp(baseGreen, other.baseGreen, t),
      base0: Color.lerp(base0, other.base0, t),
      base10: Color.lerp(base10, other.base10, t),
      base100: Color.lerp(base100, other.base100, t),
      base200: Color.lerp(base200, other.base200, t),
      base300: Color.lerp(base300, other.base300, t),
      base400: Color.lerp(base400, other.base400, t),
      base500: Color.lerp(base500, other.base500, t),
      base600: Color.lerp(base600, other.base600, t),
      base700: Color.lerp(base700, other.base700, t),
      base800: Color.lerp(base800, other.base800, t),
      base900: Color.lerp(base900, other.base900, t),
      base970: Color.lerp(base970, other.base970, t),
      primary20: Color.lerp(primary20, other.primary20, t),
      primary40: Color.lerp(primary40, other.primary40, t),
      primary100: Color.lerp(primary100, other.primary100, t),
      primary200: Color.lerp(primary200, other.primary200, t),
      primary300: Color.lerp(primary300, other.primary300, t),
      primary400: Color.lerp(primary400, other.primary400, t),
      primary500: Color.lerp(primary500, other.primary500, t),
      primary600: Color.lerp(primary600, other.primary600, t),
      primary700: Color.lerp(primary700, other.primary700, t),
      primary800: Color.lerp(primary800, other.primary800, t),
      primary900: Color.lerp(primary900, other.primary900, t),
      success40: Color.lerp(success40, other.success40, t),
      success100: Color.lerp(success40, other.success40, t),
      success200: Color.lerp(success200, other.success200, t),
      success300: Color.lerp(success300, other.success300, t),
      success400: Color.lerp(success400, other.success400, t),
      success500: Color.lerp(success500, other.success500, t),
      success550: Color.lerp(success550, other.success550, t),
      success600: Color.lerp(success600, other.success600, t),
      success700: Color.lerp(success700, other.success700, t),
      success800: Color.lerp(success800, other.success800, t),
      success900: Color.lerp(success900, other.success900, t),
      warning40: Color.lerp(warning40, other.warning40, t),
      warning50: Color.lerp(warning50, other.warning50, t),
      warning100: Color.lerp(warning100, other.warning100, t),
      warning200: Color.lerp(warning200, other.warning200, t),
      warning300: Color.lerp(warning300, other.warning300, t),
      warning400: Color.lerp(warning400, other.warning400, t),
      warning500: Color.lerp(warning500, other.warning500, t),
      warning550: Color.lerp(warning550, other.warning550, t),
      warning600: Color.lerp(warning600, other.warning600, t),
      warning700: Color.lerp(warning700, other.warning700, t),
      warning800: Color.lerp(warning800, other.warning800, t),
      warning900: Color.lerp(warning900, other.warning900, t),
      danger40: Color.lerp(danger40, other.danger40, t),
      danger100: Color.lerp(danger100, other.danger100, t),
      danger200: Color.lerp(danger200, other.danger200, t),
      danger300: Color.lerp(danger300, other.danger300, t),
      danger400: Color.lerp(danger400, other.danger400, t),
      danger500: Color.lerp(danger500, other.danger500, t),
      danger550: Color.lerp(danger550, other.danger550, t),
      danger600: Color.lerp(danger600, other.danger600, t),
      danger700: Color.lerp(danger700, other.danger700, t),
      danger800: Color.lerp(danger800, other.danger800, t),
      danger900: Color.lerp(danger900, other.danger900, t),
    );
  }

  @override
  String toString() => 'AppColors()';

  // the light theme
  static const light = AppColors(
    baseWhite: Colors.white,
    baseGreen: Color(0xff026548),
    base0: Colors.white,
    base10: Color(0xffF4F5F5),
    base100: Color(0xffE4E5E7),
    base200: Color(0xffCACBCF),
    base300: Color(0xffAFB1B6),
    base400: Color(0xff94979E),
    base500: Color(0xff797D86),
    base600: Color(0xff61646B),
    base700: Color(0xff494B50),
    base800: Color(0xff303236),
    base900: Color(0xff18191B),
    base970: Color(0xff111213),
    primary20: Color(0xffF5F8FF),
    primary40: Color(0xffEBF1FF),
    primary100: Color(0xffCCDDFF),
    primary200: Color(0xff99BBFF),
    primary300: Color(0xff6699FF),
    primary400: Color(0xff3379FF),
    primary500: Color(0xff0057FF),
    primary600: Color(0xff0044CC),
    primary700: Color(0xff003399),
    primary800: Color(0xff002266),
    primary900: Color(0xff001133),
    success40: Color(0xffF0FAF1),
    success100: Color(0xffD9F2DD),
    success200: Color(0xffB3E5BB),
    success300: Color(0xff8CD999),
    success400: Color(0xff66CC77),
    success500: Color(0xff40BF54),
    success550: Color(0xff39AC4C),
    success600: Color(0xff339944),
    success700: Color(0xff267333),
    success800: Color(0xff194D22),
    success900: Color(0xff0d2611),
    warning40: Color(0xffFFF9E5),
    warning50: Color(0xffFFF9E6),
    warning100: Color(0xffFFF3CC),
    warning200: Color(0xffFFE599),
    warning300: Color(0xffFFD966),
    warning400: Color(0xffFFCC33),
    warning500: Color(0xffFFBF00),
    warning550: Color(0xffE5AC00),
    warning600: Color(0xffCC9900),
    warning700: Color(0xff997300),
    warning800: Color(0xff664D00),
    warning900: Color(0xff332600),
    danger40: Color(0xffFFEBEB),
    danger100: Color(0xffFFCCCC),
    danger200: Color(0xffFF9999),
    danger300: Color(0xffFF6666),
    danger400: Color(0xffFF3333),
    danger500: Color(0xffFF0000),
    danger550: Color(0xffE50000),
    danger600: Color(0xffCC0000),
    danger700: Color(0xff990000),
    danger800: Color(0xff660000),
    danger900: Color(0xff330000),
  );

  // the dark theme
  static const dark = light;

  static const randomColors = [
    Color(0xff40BF55),
    Color(0xff40BFAA),
    Color(0xff4080BF),
    Color(0xff5540BF),
    Color(0xffAA40BF),
    Color(0xffBF407F),
    Color(0xffBF5540),
    Color(0xffBFAA40),
  ];

  static AppColors resolve({Brightness? brightness}) =>
      (brightness ?? PlatformDispatcher.instance.platformBrightness) ==
          Brightness.light
      ? light
      : dark;
}
