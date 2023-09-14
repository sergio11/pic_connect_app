extension StringAgeCalculation on String {
  int calculateAgeFromBirthDate() {
    if (isEmpty) {
      return 0; // Return 0 if the string is empty
    }

    final birthDateParts = split('-'); // Assuming birthDate is in 'YYYY-MM-DD' format
    if (birthDateParts.length != 3) {
      return 0; // Return 0 if birthDate is in an invalid format
    }

    final birthYear = int.tryParse(birthDateParts[0]);
    final birthMonth = int.tryParse(birthDateParts[1]);
    final birthDay = int.tryParse(birthDateParts[2]);

    if (birthYear == null || birthMonth == null || birthDay == null) {
      return 0; // Return 0 if any part of the date is not a valid integer
    }

    final currentDate = DateTime.now();
    final age = currentDate.year - birthYear;

    // Check if the birthday has occurred this year
    if (currentDate.month < birthMonth || (currentDate.month == birthMonth && currentDate.day < birthDay)) {
      // Subtract 1 from age if the birthday has not occurred yet this year
      return age - 1;
    }

    return age;
  }
}
