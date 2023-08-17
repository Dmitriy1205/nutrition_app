enum MoonPhase {
  NewMoon,
  FirstQuarter,
  FullMoon,
  LastQuarter,
}

MoonPhase calculateMoonPhase(double latitude, double longitude) {
  final moonPhaseAngle = calculateMoonPhaseAngle(DateTime.now());
  final sunLongitude = calculateSunLongitude(DateTime.now());
  final moonLongitude = calculateMoonLongitude(DateTime.now());

  final diff = (moonLongitude - sunLongitude + 360) % 360;

  // Adjust the moon phase angle based on your time zone and location
  final adjustedMoonPhaseAngle = (moonPhaseAngle - longitude / 15 + diff) % 360;

  if (adjustedMoonPhaseAngle < 45) {
    return MoonPhase.NewMoon;
  } else if (adjustedMoonPhaseAngle < 135) {
    return MoonPhase.FirstQuarter;
  } else if (adjustedMoonPhaseAngle < 225) {
    return MoonPhase.FullMoon;
  } else {
    return MoonPhase.LastQuarter;
  }
}

double calculateMoonPhaseAngle(DateTime date) {
  // Calculate the moon's age in days since the last new moon
  final daysSinceNewMoon =
      (date.difference(DateTime(2023, 8, 4)).inHours / 24) % 29.53;
  return daysSinceNewMoon * 360 / 29.53;
}

double calculateSunLongitude(DateTime date) {
  // Calculate the sun's longitude for the given date
  // This calculation involves complex formulas, refer to astronomy references
  // or specialized libraries for precise calculations
  return 0; // Placeholder value, replace with accurate calculation
}

double calculateMoonLongitude(DateTime date) {
  // Calculate the moon's longitude for the given date
  // This calculation involves complex formulas, refer to astronomy references
  // or specialized libraries for precise calculations
  return 0; // Placeholder value, replace with accurate calculation
}

String getCycleByMoon({required MoonPhase moonPhase}) {
  if (moonPhase == MoonPhase.NewMoon) {
    return 'Menstrual';
  } else if (moonPhase == MoonPhase.FirstQuarter) {
    return 'Follicular';
  } else if (moonPhase == MoonPhase.FullMoon) {
    return 'Ovulatory';
  } else {
    return 'Luteal';
  }
}
