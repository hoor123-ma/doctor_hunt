String? validateFullName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Full name is required';
  }

  if (value.trim().length < 3) {
    return 'Enter a valid name';
  }

  return null;
}
