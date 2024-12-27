String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a name';
  }

  // Regular expression to allow letters, spaces, and basic name characters
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');

  if (!nameRegex.hasMatch(value)) {
    return 'Please enter a valid name (letters and spaces only)';
  }

  return null; // Return null if the validation passes
}
