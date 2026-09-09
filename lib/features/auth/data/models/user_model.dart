class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? imageUrl;
  final String role;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.imageUrl,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "imageUrl": imageUrl,
      "role": role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      role: json["role"],
      imageUrl: json["imageUrl"],
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? imageUrl,
    String? role,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      role: role ?? this.role,
    );
  }
}
