import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/JobsModel.dart';
import '../models/StatisticDataModel.dart';
import '../models/SurveyModel.dart';
import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiService {
  static const String baseUrl = "https://immune-bull-smoothly.ngrok-free.app/api";
  String? _bearerToken;

  // Method to retrieve the bearer token
  String? getBearerToken() => _bearerToken;

  // Method to store the bearer token
  void setAuthToken(String token) {
    _bearerToken = token;
  }

  Future<UserModel> loginUser(String email, String password) async {
    final String url = '$baseUrl/users/login';
    final response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body));
      // Simpan token dan data pengguna setelah login
      setAuthToken(user.token);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      await prefs.setString('nama', user.nama);
      await prefs.setString('imagePath', user.imagePath);
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }



  Future<SurveyModel> submitSurvey(
      int tahunMasuk,
      int tahunLulus,
      String mulaiBekerja,
      String tingkatTempatKerja,
      List<String> caraMencariPekerjaan,
      String pekerjaan,
      String jarakTahunLulusPekerjaan,
      String rangeGaji,
      String jenisPerusahaan,
      String sesuaiJurusan,
      String namaPerusahaan,
      String provinsiTempatKerja,
      String pendidikanTepat,
      String studiDiambil,
      String namaProgramStudi,
      String namaKampus,
      ) async {
    final String url = '$baseUrl/survey';

    // Ambil token dari SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan. Harap login kembali.');
    }

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun_masuk': tahunMasuk,
        'tahun_lulus': tahunLulus,
        'kapan_anda_mulai_mencari_pekerjaan': mulaiBekerja,
        'apa_tingkat_tempat_kerja_anda': tingkatTempatKerja,
        'bagaimana_anda_mencari_pekerjaan_tersebut': caraMencariPekerjaan,
        'pekerjaan_anda': pekerjaan,
        'jarak_tahun_lulus_dan_mendapat_pekerjaan': jarakTahunLulusPekerjaan,
        'berapa_range_gaji_anda_ditempat_kerja_setiap_bulan': rangeGaji,
        'jenis_perusahaan_instansi_tempat_anda_bekerja': jenisPerusahaan,
        'apakah_pekerjaan_anda_sesuai_dengan_jurusan_dan_bidang_ilmu_anda': sesuaiJurusan,
        'nama_perusahaan_instansi_tempat_anda_bekerja': namaPerusahaan,
        'provinsi_tempat_kerja': provinsiTempatKerja,
        'tingkat_pendidikan_apa_yg_paling_tepat_sesuai_untuk_pekerjaan_anda_saat_ini': pendidikanTepat,
        'studi_yang_diambil': studiDiambil,
        'nama_program_studi_yang_diambil': namaProgramStudi,
        'nama_kampus': namaKampus,
      }),
    );

    if (response.statusCode == 201) {
      return SurveyModel.fromJson(jsonDecode(response.body));
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('Gagal Mengirim');
    }
  }

  Future<List<Job>> getJobs() async {
    final String url = '$baseUrl/jobs';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((job) => Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<List<ArticleModel>> getArticles() async {
    final String url = '$baseUrl/articles';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((articleJson) => ArticleModel.fromJson(articleJson)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<StatisticResponse> fetchStatistics() async {
    final String url = '$baseUrl/statistic';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return StatisticResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load statistics');
    }
  }
}