class SurveyModel {
  final String nama;
  final int nim;
  final String fakultas;
  final String programStudi;
  final String jenisKelamin;
  final String emailKampus;
  final String emailPribadi;
  final String noHp;
  final int tahunMasuk;
  final int tahunLulus;
  final String kapanMulaiPekerjaan;
  final String tingkatTempatKerja;
  final List<String> caraMencariPekerjaan;
  final String pekerjaan;
  final String jarakTahunLulusPekerjaan;
  final String rangeGaji;
  final String jenisPerusahaan;
  final String sesuaiJurusan;
  final String namaPerusahaan;
  final String provinsiTempatKerja;
  final String pendidikanTepat;
  final String studiDiambil;
  final String namaProgramStudi;
  final String namaKampus;

  SurveyModel({
    required this.nama,
    required this.nim,
    required this.fakultas,
    required this.programStudi,
    required this.jenisKelamin,
    required this.emailKampus,
    required this.emailPribadi,
    required this.noHp,
    required this.tahunMasuk,
    required this.tahunLulus,
    required this.kapanMulaiPekerjaan,
    required this.tingkatTempatKerja,
    required this.caraMencariPekerjaan,
    required this.pekerjaan,
    required this.jarakTahunLulusPekerjaan,
    required this.rangeGaji,
    required this.jenisPerusahaan,
    required this.sesuaiJurusan,
    required this.namaPerusahaan,
    required this.provinsiTempatKerja,
    required this.pendidikanTepat,
    required this.studiDiambil,
    required this.namaProgramStudi,
    required this.namaKampus,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      nama: json['data']['nama'],
      nim: json['data']['nim'],
      fakultas: json['data']['fakultas'],
      programStudi: json['data']['program_studi'],
      jenisKelamin: json['data']['jenis_kelamin'],
      emailKampus: json['data']['email_kampus'],
      emailPribadi: json['data']['email_pribadi'],
      noHp: json['data']['no_hp'],
      tahunMasuk: json['data']['tahun_masuk'],
      tahunLulus: json['data']['tahun_lulus'],
      kapanMulaiPekerjaan: json['data']['kapan_anda_mulai_mencari_pekerjaan'],
      tingkatTempatKerja: json['data']['apa_tingkat_tempat_kerja_anda'],
      caraMencariPekerjaan: List<String>.from(json['data']['bagaimana_anda_mencari_pekerjaan_tersebut']),
      pekerjaan: json['data']['pekerjaan_anda'],
      jarakTahunLulusPekerjaan: json['data']['jarak_tahun_lulus_dan_mendapat_pekerjaan'],
      rangeGaji: json['data']['berapa_range_gaji_anda_ditempat_kerja_setiap_bulan'],
      jenisPerusahaan: json['data']['jenis_perusahaan_instansi_tempat_anda_bekerja'],
      sesuaiJurusan: json['data']['apakah_pekerjaan_anda_sesuai_dengan_jurusan_dan_bidang_ilmu_anda'],
      namaPerusahaan: json['data']['nama_perusahaan_instansi_tempat_anda_bekerja'],
      provinsiTempatKerja: json['data']['provinsi_tempat_kerja'],
      pendidikanTepat: json['data']['tingkat_pendidikan_apa_yg_paling_tepat_sesuai_untuk_pekerjaan_anda_saat_ini'],
      studiDiambil: json['data']['studi_yang_diambil'],
      namaProgramStudi: json['data']['nama_program_studi_yang_diambil'],
      namaKampus: json['data']['nama_kampus'],
    );
  }
}
