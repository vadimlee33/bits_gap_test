import 'package:flutter_svg/flutter_svg.dart';

import 'app_icons.dart';
import 'enums.dart';

extension SpeciesExtension on Species {
  static final Map<String, Species> _stringToSpecies = {
    'human': Species.human,
    'alien': Species.alien,
  };

  static Species fromString(String species) {
    return _stringToSpecies[species.toLowerCase()] ?? Species.alien;
  }

  String get name {
    switch (this) {
      case Species.human:
        return 'Human';
      case Species.alien:
      default:
        return 'Alien';
    }
  }

  SvgPicture get icon {
    switch (this) {
      case Species.human:
        return AppIcons.humanIcon();
      case Species.alien:
      default:
        return AppIcons.alienIcon();
    }
  }
}

extension GenderExtension on Gender {
  static final Map<String, Gender> _stringToGender = {
    'male': Gender.male,
    'female': Gender.female,
    'unknown': Gender.unknown,
  };

  static Gender fromString(String gender) {
    return _stringToGender[gender.toLowerCase()] ?? Gender.unknown;
  }

  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.unknown:
      default:
        return 'Unknown';
    }
  }

  SvgPicture get icon {
    switch (this) {
      case Gender.male:
        return AppIcons.maleIcon();
      case Gender.female:
        return AppIcons.femaleIcon();
      case Gender.unknown:
      default:
        return AppIcons.unknownGenderIcon();
    }
  }
}

extension StatusExtension on Status {
  static final Map<String, Status> _stringToStatus = {
    'alive': Status.alive,
    'dead': Status.dead,
    'unknown': Status.unknown,
  };

  static Status fromString(String status) {
    return _stringToStatus[status.toLowerCase()] ?? Status.unknown;
  }

  String get name {
    switch (this) {
      case Status.alive:
        return 'Alive';
      case Status.dead:
        return 'Dead';
      case Status.unknown:
      default:
        return 'Unknown';
    }
  }

  SvgPicture get icon {
    switch (this) {
      case Status.alive:
        return AppIcons.aliveIcon();
      case Status.dead:
        return AppIcons.deadIcon();
      case Status.unknown:
      default:
        return AppIcons.unknownStatusIcon();
    }
  }
}
