String? validateForgetPasswordCode(String? code) {
  if (code == null || code.isEmpty) {
    return "Enter code";
  }
  if (code.length < 4) {
    return "Enter 4 digits of code";
  }
  return null;
}
