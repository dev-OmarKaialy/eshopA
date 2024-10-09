class UserModel {
  final int? id;
  final String? fullName;
  final String? userName;
  final String? email;
  final DateTime? birthDate;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? token;

  const UserModel({
    this.id,
    this.fullName,
    this.userName,
    this.email,
    this.birthDate,
    this.updatedAt,
    this.createdAt,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullName: json["full_name"],
        userName: json["user_name"],
        email: json["email"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        token: json["token"],
      );
}
