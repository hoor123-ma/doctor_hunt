class DoctorModel {
  final String imageUrl;
  final String name;
  final String title;
  final double rating;
  final double price;
  final int experienceYears;

  const DoctorModel({
    required this.imageUrl,
    required this.name,
    this.title = "",
    required this.rating,
    this.price = 0,
    this.experienceYears = 0,
  });
}
