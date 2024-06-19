class UserModel {
  final String id;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['id'],
      email: json['data']['email'],
      token: json['data']['token'],
    );
  }
}
