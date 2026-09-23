class AdminDoctorModel {
  final String id;
  final String imageUrl;
  final String name;
  final String speciality;
  final bool isActive;

  const AdminDoctorModel({
    required this.imageUrl,
    required this.name,
    required this.speciality,
    required this.isActive,
    required this.id,
  });

  factory AdminDoctorModel.fromJson(Map<String, dynamic> json) {
    return AdminDoctorModel(
      id: json["id"] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      speciality: json['specialist'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'specialist': speciality,
      'isActive': isActive,
    };
  }

  AdminDoctorModel copyWith({
    String? imageUrl,
    String? name,
    String? speciality,
    bool? isActive,
  }) {
    return AdminDoctorModel(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      speciality: speciality ?? this.speciality,
      isActive: isActive ?? this.isActive,
      id: id,
    );
  }
}
