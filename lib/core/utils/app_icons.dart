import 'package:bitsgap_test_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  const AppIcons._();

  static const String _basePath = 'assets/svg/';
  static const double _heightSize = 24.0;
  static const double _widthSize = 24.0;

  static SvgPicture unknownGenderIcon() {
    return SvgPicture.asset(
      '${_basePath}unknownGenderIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture femaleIcon() {
    return SvgPicture.asset(
      '${_basePath}femaleIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture maleIcon() {
    return SvgPicture.asset(
      '${_basePath}maleIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture aliveIcon() {
    return SvgPicture.asset(
      '${_basePath}aliveIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture deadIcon() {
    return SvgPicture.asset(
      '${_basePath}deadIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture unknownStatusIcon() {
    return SvgPicture.asset(
      '${_basePath}unknownStatusIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture humanIcon() {
    return SvgPicture.asset(
      '${_basePath}humanIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture alienIcon() {
    return SvgPicture.asset(
      '${_basePath}alienIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture arrowLeftIcon() {
    return SvgPicture.asset(
      '${_basePath}arrowLeftIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(AppColors.nero, BlendMode.srcIn),
    );
  }

  static SvgPicture informationIcon() {
    return SvgPicture.asset(
      '${_basePath}informationIcon.svg',
      width: _widthSize,
      height: _heightSize,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  static SvgPicture likedIcon() {
    return SvgPicture.asset(
      '${_basePath}likedIcon.svg',
      width: 20.0,
      height: 20.0,
    );
  }

  static SvgPicture unlikedIcon() {
    return SvgPicture.asset(
      '${_basePath}unlikedIcon.svg',
      width: 20.0,
      height: 20.0,
    );
  }
  // Add more icons as needed
}
