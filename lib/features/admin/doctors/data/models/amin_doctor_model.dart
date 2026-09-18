class AdminDoctorModel {
  final String imageUrl;
  final String name;
  final String specialist;
  final bool isActive;

  const AdminDoctorModel({
    required this.imageUrl,
    required this.name,
    required this.specialist,
    required this.isActive,
  });

  factory AdminDoctorModel.fromJson(Map<String, dynamic> json) {
    return AdminDoctorModel(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      specialist: json['specialist'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'specialist': specialist,
      'isActive': isActive,
    };
  }
}