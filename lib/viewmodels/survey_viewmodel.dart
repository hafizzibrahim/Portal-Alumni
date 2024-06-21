import 'package:flutter/cupertino.dart';
import 'package:portal_alumni_v1/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();

  Future<void> survey(
    String nama,
    int nim,
    String fakultas,
    String programStudi,
    String jenisKelamin,
    String emailKampus,
    String emailPribadi,
    String noHp,
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
          nama,
          nim,
          fakultas,
          programStudi,
          jenisKelamin,
          emailKampus,
          emailPribadi,
          noHp,
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

      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', response.token);
      // await prefs.setString('nama', response.nama);
      // await prefs.setString('fakultas', response.fakultas);
      // await prefs.setString('programStudi', response.programStudi);
      // await prefs.setString('jenisKelamin', response.jenisKelamin);
      // await prefs.setString('emailkampus', response.emailKampus);
      // await prefs.setString('emailPribadi', response.emailPribadi);
      // await prefs.setString('noHp', response.noHp);
      // await prefs.setString('tahunMasuk', response.tahunMasuk as String);
      // await prefs.setString('tahunLulus', response.tahunLulus as String);
      // await prefs.setString('mulaiBekerja', response.kapanMulaiPekerjaan);
      // await prefs.setString('tingkatTempatKerja', response.tingkatTempatKerja);
      // await prefs.setString('caraMencariPekerjaan', response.caraMencariPekerjaan as String);
      // await prefs.setString('pekerjaan', response.pekerjaan);
      // await prefs.setString('jarakTahunLulusPekerjaan', response.jarakTahunLulusPekerjaan);
      // await prefs.setString('rangeGaji', response.rangeGaji);
      // await prefs.setString('jenisPerusahaan', response.jenisPerusahaan);
      // await prefs.setString('sesuaiJurusan', response.sesuaiJurusan);
      // await prefs.setString('namaPerusahaan', response.namaPerusahaan);
      // await prefs.setString('provinsiTempatKerja', response.provinsiTempatKerja);
      // await prefs.setString('pendidikanTepat', response.pendidikanTepat);
      // await prefs.setString('studiDiambil', response.studiDiambil);
      // await prefs.setString('namaProgramStudi', response.namaProgramStudi);
      // await prefs.setString('namaKampus', response.namaKampus);

      //print('Submit Successful');
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
