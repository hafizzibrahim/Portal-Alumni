class UserModel {
  final String id;
  final String email;
  final int nim;
  final String fakultas;
  final String jurusan;
  final int tahunLulus;
  final String imagePath;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.nim,
    required this.fakultas,
    required this.jurusan,
    required this.tahunLulus,
    required this.imagePath,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['id'],
      email: json['data']['email'],
      nim: json['data']['nim'],
      fakultas: json['data']['fakultas'],
      jurusan: json['data']['jurusan'],
      tahunLulus: json['data']['tahun_lulus'],
      imagePath: json['data']['image_path'],
      token: json['data']['token'],
    );
  }
}
