import 'dart:math';

import 'package:intl/intl.dart';
import 'package:nutrition_app/common/strings.dart';

enum Hemisphere { northern, southern }

enum CyclePhase {
  menstrual,
  follicular,
  ovulatory,
  luteal,
}

String generateRandomPhrase({required String ingredient}) {
  String randomPhrase = phrases[Random().nextInt(phrases.length)];
  String generatedPhrase =
      randomPhrase.replaceFirst("{ingredient}", ingredient);
  return generatedPhrase;
}

String extractRecipeName(String recipeText) {
  // Split the recipeText by newlines
  List<String> lines = recipeText.split('\n');

  // Check if the first line starts with "Recipe:"
  if (lines.isNotEmpty && lines[0].startsWith('Recipe:')) {
    // Remove "Recipe:" and return the rest of the line
    return lines[0].replaceFirst('Recipe:', '').trim();
  }

  // If the first line does not start with "Recipe:", return the original line
  return lines[0];
}

List<String> extractSections(String recipeText) {
  // Split the recipeText by newlines
  List<String> sections = recipeText.split('\n');

  // Remove the first element (Recipe header)
  if (sections.isNotEmpty) {
    sections.removeAt(0);
  }
  // for (int i = 0; i < sections.length; i++) {
  //   if (sections[i].toLowerCase().startsWith('note:')) {
  //     sections[i] = '**' + sections[i] + '**';
  //   }
  // }

  return sections;
}

DateTime parseDateString(String dateString) {
  List<int> dateParts = dateString.split('-').map(int.parse).toList();
  return DateTime(dateParts[0], dateParts[1], dateParts[2]);
}

List<int> generateRandomFoodList(int maxIndex) {
  List<int> indices = List.generate(maxIndex, (index) => index);
  indices.shuffle(); // Shuffle the indices
  return indices.sublist(0, 18); // Return the first `count` indices
}

String getSeasonFromLocation({required String latitudeString}) {
  double latitude = double.parse(latitudeString);
  final currentMonth = int.parse(DateFormat('MM').format(DateTime.now()));
  final hemisphere = latitude >= 0 ? Hemisphere.northern : Hemisphere.southern;

  switch (currentMonth) {
    case 12:
    case 1:
    case 2:
      return hemisphere == Hemisphere.northern ? "Winter" : "Summer";
    case 3:
    case 4:
    case 5:
      return hemisphere == Hemisphere.northern ? "Spring" : "Autumn";
    case 6:
    case 7:
    case 8:
      return hemisphere == Hemisphere.northern ? "Summer" : "Winter";
    case 9:
    case 10:
    case 11:
      return hemisphere == Hemisphere.northern ? "Autumn" : "Spring";
    default:
      return "Unknown";
  }
}

String getMealTime() {
  int hour = DateTime.now().hour;
  String period = hour < 12 ? 'AM' : 'PM';

  if (hour >= 0 && hour < 1) {
    return 'Dinner';
  } else if ((hour >= 1 && hour < 12 && period == 'AM') ||
      (hour == 12 && period == 'PM')) {
    return 'Breakfast';
  } else if (hour >= 1 && hour < 7 && period == 'PM') {
    return 'Lunch';
  } else {
    return 'Dinner';
  }
}

String cyclePhaseToString(CyclePhase phase) {
  switch (phase) {
    case CyclePhase.menstrual:
      return 'Menstrual';
    case CyclePhase.follicular:
      return 'Follicular';
    case CyclePhase.ovulatory:
      return 'Ovulatory';
    case CyclePhase.luteal:
      return 'Luteal';
    default:
      return 'Unknown';
  }
}

CyclePhase getCurrentCyclePhase({
  required DateTime dateOfSaving,
  required int dayOfCycle,
  required int cycleLength,
  required int periodLength,
}) {
  // Calculate the current day of the cycle based on the current date and the saved day of the cycle
  int daysSinceCycleStart = DateTime.now().difference(dateOfSaving).inDays + 1;

  // Normalize the day of the cycle to make sure it stays within the cycle length
  int normalizedDayOfCycle = (daysSinceCycleStart % cycleLength) + 1;

  // Calculate the phase boundaries
  int menstrualPhaseEnd = periodLength;
  int follicularPhaseEnd = menstrualPhaseEnd + 8;
  int ovulatoryPhaseEnd = menstrualPhaseEnd + 11;

  // Determine the current phase
  if (normalizedDayOfCycle <= menstrualPhaseEnd) {
    return CyclePhase.menstrual;
  } else if (normalizedDayOfCycle <= follicularPhaseEnd) {
    return CyclePhase.follicular;
  } else if (normalizedDayOfCycle <= ovulatoryPhaseEnd) {
    return CyclePhase.ovulatory;
  } else {
    return CyclePhase.luteal;
  }
}
