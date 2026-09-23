String? validateDoctorSpeciality(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Doctor speciality is required';
  }

  return null;
}
