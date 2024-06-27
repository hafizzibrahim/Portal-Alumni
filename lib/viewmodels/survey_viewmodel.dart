import 'package:flutter/cupertino.dart';
import 'package:portal_alumni_v1/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();

  Future<void> survey(
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
    try {
      await apiService.submitSurvey(
          tahunMasuk,
          tahunLulus,
          mulaiBekerja,
          tingkatTempatKerja,
          caraMencariPekerjaan,
          pekerjaan,
          jarakTahunLulusPekerjaan,
          rangeGaji,
          jenisPerusahaan,
          sesuaiJurusan,
          namaPerusahaan,
          provinsiTempatKerja,
          pendidikanTepat,
          studiDiambil,
          namaProgramStudi,
          namaKampus);

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
