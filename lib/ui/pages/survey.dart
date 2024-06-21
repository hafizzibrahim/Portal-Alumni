part of 'pages.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyTestState();
}

class _SurveyTestState extends State<SurveyPage> {
  final _namaLengkapController = TextEditingController();
  final _nimController = TextEditingController();
  final _fakultasController = TextEditingController();
  final _programStudiController = TextEditingController();
  final _jenisKelaminController = TextEditingController();
  final _emailKampusController = TextEditingController();
  final _emailPribadiController = TextEditingController();
  final _noHpController = TextEditingController();
  final _tahunMasukController = TextEditingController();
  final _tahunLulusController = TextEditingController();
  final _mencariPekerjaanController = TextEditingController();
  final _tingkatanPekerjaan = TextEditingController();
  final _statusPekerjaanController = TextEditingController();
  final _jarakLulusdanKerja = TextEditingController();
  final _rangeGajiController = TextEditingController();
  final _jenisPerusahaanController = TextEditingController();
  final _kesesuaianPekerjaanController = TextEditingController();
  final _namaPerusahaanController = TextEditingController();
  final _provinsiPekerjaanController = TextEditingController();
  final _tingkatPendidikanController = TextEditingController();
  final _studiDiambilController = TextEditingController();
  final _namaProdiDiambilController = TextEditingController();
  final _namaKampusController = TextEditingController();
  bool _isSelected = false;

  List<String> cariPekerjaan = [
    'Melalui iklan di koran/majalah, brosur',
    'Melamar ke perusahaan tanpa mengetahui lowongan yang ada',
    'Pergi ke bursa/pameran kerja',
    'Mencari lewat internet/iklan online/milis',
    'Dihubungi oleh perusahaan',
    'Menghubungi Kemenakertrans',
    'Menghubungi agen tenaga kerja komersial/swasta',
    'Memeroleh informasi dari pusat/kantor pengembangan karir fakultas/universitas',
    'Menghubungi kantor kemahasiswaan/hubungan alumni',
    'Membangun jejaring (network) sejak masih kuliah',
    'Melalui relasi (misalnya dosen, orang tua, saudara, teman, dll.)',
    'Membangun bisnis sendiri',
    'Melalui penempatan kerja atau magang',
    'Bekerja di tempat yang sama dengan tempat kerja semasa kuliah'
  ];

  List<bool> selectedJob = List.generate(14, (index) => false);

  Future<void> _submit() async {
    final nama = _namaLengkapController.text;
    final nim = int.tryParse(_nimController.text) ?? 0;
    final fakultas = _fakultasController.text;
    final prodi = _programStudiController.text;
    final jenisKelamin = _jenisKelaminController.text;
    final emailKampus = _emailKampusController.text;
    final emailPribadi = _emailPribadiController.text;
    final noHp = _noHpController.text;
    final tahunMasuk = int.tryParse(_tahunMasukController.text) ?? 0;
    final tahunLulus = int.tryParse(_tahunLulusController.text) ?? 0;
    final cariKerja = _mencariPekerjaanController.text;
    final tingkatanPekerjaan = _tingkatanPekerjaan.text;
    final caraMencariKerja = selectedJob
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => cariPekerjaan[entry.key])
        .toList();
    final statusPekerjaan = _statusPekerjaanController.text;
    final jarakLulusdanKerja = _jarakLulusdanKerja.text;
    final rangeGaji = _rangeGajiController.text;
    final jenisPerusahaan = _jenisPerusahaanController.text;
    final kesesuaian = _kesesuaianPekerjaanController.text;
    final namaPerusahaan = _namaPerusahaanController.text;
    final provinsiKerja = _provinsiPekerjaanController.text;
    final tingkatPendidikan = _tingkatPendidikanController.text;
    final studiDiambil = _studiDiambilController.text;
    final namaProdiDiambil = _namaProdiDiambilController.text;
    final namaKampus = _namaKampusController.text;
    final selected = _isSelected;

    try {
      await Provider.of<SurveyViewModel>(context, listen: false).survey(
          nama,
          nim,
          fakultas,
          prodi,
          jenisKelamin,
          emailKampus,
          emailPribadi,
          noHp,
          tahunMasuk,
          tahunLulus,
          cariKerja,
          tingkatanPekerjaan,
          caraMencariKerja,
          statusPekerjaan,
          jarakLulusdanKerja,
          rangeGaji,
          jenisPerusahaan,
          kesesuaian,
          namaPerusahaan,
          provinsiKerja,
          tingkatPendidikan,
          studiDiambil,
          namaProdiDiambil,
          namaKampus,);

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Login Successful',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: const Text('Data Berhasil Dikirim'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pushReplacementNamed(context, '/tracer-study-selesai-page');
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );

    } catch (e) {
      print('Submit Error : $e');
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(e.toString()),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Okay'))
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: AppBar(
        backgroundColor: whiteblueColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Survey',
          style: blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          surveySection(context, 'Data Diri'),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Nama',
            maxLines: 1,
            controller: _namaLengkapController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'NIM',
            maxLines: 1,
            controller: _nimController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Faklutas',
            listValue: const [
              DropdownMenuEntry(value: 'Hukum', label: 'Hukum'),
              DropdownMenuEntry(
                  value: 'Keguruan dan Ilmu Pendidikan',
                  label: 'Keguruan dan Ilmu Pendidikan'),
              DropdownMenuEntry(value: 'Teknik', label: 'Teknik'),
              DropdownMenuEntry(value: 'Pertanian', label: 'Pertanian'),
              DropdownMenuEntry(
                  value: 'Ilmu Sosial dan Ilmu Politik',
                  label: 'Ilmu Sosial dan Ilmu Politik'),
            ],
            controller: _fakultasController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Program Studi',
            maxLines: 1,
            controller: _programStudiController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Jenis Kelamin',
            listValue: const [
              DropdownMenuEntry(value: 'Laki-Laki', label: 'Laki-Laki'),
              DropdownMenuEntry(value: 'Perempuan', label: 'Perempuan'),
            ],
            controller: _jenisKelaminController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Email Kampus',
            maxLines: 1,
            controller: _emailKampusController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Email Pribadi',
            maxLines: 1,
            controller: _emailPribadiController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'No Handphone / WhatsApp',
            maxLines: 1,
            controller: _noHpController,
          ),
          const SizedBox(
            height: 40,
          ),
          surveySection(context, 'Data Wisuda'),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Tahun Masuk',
            maxLines: 1,
            controller: _tahunMasukController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Tahun Lulus',
            maxLines: 1,
            controller: _tahunLulusController,
          ),
          const SizedBox(
            height: 40,
          ),
          surveySection(context, 'Data Pekerjaan'),
          const SizedBox(
            height: 20,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Kapan anda memulai mencari pekerjaan?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Beberapa bulan setelah lulus',
                  label: 'Beberapa bulan setelah lulus'),
              DropdownMenuEntry(
                  value: 'Beberapa bulan setelah lulus',
                  label: 'Beberapa bulan setelah lulus'),
              DropdownMenuEntry(
                  value: 'Saya Tidak Mencari Kerja',
                  label: 'Saya Tidak Mencari Kerja')
            ],
            controller: _mencariPekerjaanController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Apa tingkat tempat kerja Anda?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Lokal/Wiraswasta tidak berbadan hukum',
                  label: 'Lokal/Wiraswasta tidak berbadan hukum'),
              DropdownMenuEntry(
                  value: 'Lokal/Wiraswasta tidak berbadan hukum',
                  label: 'Lokal/Wiraswasta tidak berbadan hukum'),
              DropdownMenuEntry(value: 'Internasional', label: 'Internasional')
            ],
            controller: _tingkatanPekerjaan,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Bagaimana anda mencari pekerjaan tersebut? Jawaban bisa lebih dari satu',
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cariPekerjaan.length,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: Checkbox(
                        value: selectedJob[i],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedJob[i] = value ?? false;
                          });
                        }),
                  ),
                  Expanded(
                    child: Text(
                      cariPekerjaan[i],
                      style: blackTextStyle,
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Pekerjaan anda?',
            listValue: const [
              DropdownMenuEntry(value: 'Belum Bekerja', label: 'Belum bekerja'),
              DropdownMenuEntry(
                  value: 'Karyawan Swasta/Staff',
                  label: 'Karyawan Swasta/Staff'),
              DropdownMenuEntry(
                  value: 'Wirausaha/Pemilik Usaha',
                  label: 'Wirausaha/Pemilik Usaha'),
              DropdownMenuEntry(
                  value: 'First Line Management/Eselon IV',
                  label: 'First Line Management/Eselon IV'),
              DropdownMenuEntry(
                  value: 'Middle Line Management/Eselon III',
                  label: 'Middle Line Management/Eselon III'),
              DropdownMenuEntry(
                  value: 'Top Management/Eselon I dan Eselon II',
                  label: 'Top Management/Eselon I dan Eselon II'),
              DropdownMenuEntry(value: 'Guru', label: 'Guru'),
              DropdownMenuEntry(value: 'Dosen', label: 'Dosen'),
              DropdownMenuEntry(
                  value: 'Melanjutkan Pendidikan',
                  label: 'Melanjutkan Pendidikan'),
            ],
            controller: _statusPekerjaanController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Berapa range gaji anda ditempat kerja setiap bulan?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Kurang dari 6 bulan', label: 'Kurang dari 6 bulan'),
              DropdownMenuEntry(
                  value: '6 Bulan - 1 Tahun', label: '6 Bulan - 1 Tahun'),
              DropdownMenuEntry(
                  value: 'Lebih dari 1 Tahun', label: 'Lebih dari 1 Tahun'),
              DropdownMenuEntry(
                  value: 'Sedang Wirausaha', label: 'Sedang Wirausaha'),
            ],
            controller: _jarakLulusdanKerja,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Berapa range gaji anda ditempat kerja setiap bulan?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Kurang dari 3 Juta', label: 'Kurang dari 3 Juta'),
              DropdownMenuEntry(value: '3 - 5 Juta', label: '3 - 5 Juta'),
              DropdownMenuEntry(value: '5 – 8 Juta', label: '5 – 8 Juta'),
              DropdownMenuEntry(value: '8 – 10 Juta', label: '8 – 10 Juta'),
              DropdownMenuEntry(
                  value: 'Lebih dari 10 Juta', label: 'Lebih dari 10 Juta'),
            ],
            controller: _rangeGajiController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Jenis perusahaan/instansi tempat anda bekerja?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Instansi Pemerintah', label: 'Instansi Pemerintah'),
              DropdownMenuEntry(
                  value: 'Organisasi non-profit/Lembaga Swadaya Masyarakat',
                  label: 'Organisasi non-profit/Lembaga Swadaya Masyarakat'),
              DropdownMenuEntry(
                  value: 'Perusahaan swasta', label: 'Perusahaan swasta'),
              DropdownMenuEntry(
                  value: 'Wiraswasta/Bekerja Sendiri',
                  label: 'Wiraswasta/Bekerja Sendiri'),
              DropdownMenuEntry(value: 'BUMN/BUMD', label: 'BUMN/BUMD'),
              DropdownMenuEntry(
                  value: 'Institusi/Organisasi multilateral',
                  label: 'Institusi/Organisasi multilateral'),
              DropdownMenuEntry(value: 'Lainnya', label: 'Lainnya'),
            ],
            controller: _jenisPerusahaanController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label:
            'Apakah pekerjaan anda sesuai dengan jurusan dan bidang ilmu anda?',
            listValue: const [
              DropdownMenuEntry(value: 'Sesuai', label: 'Sesuai'),
              DropdownMenuEntry(value: 'Tidak Sesuai', label: 'Tidak Sesuai'),
              DropdownMenuEntry(value: 'Netral', label: 'Netral'),
            ],
            controller: _kesesuaianPekerjaanController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Nama perusahaan/instansi tempat anda bekerja?',
            maxLines: 2,
            controller: _namaPerusahaanController,
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Provinsi tempat kerja?',
            listValue: const [
              DropdownMenuEntry(value: 'Banten', label: 'Banten'),
              DropdownMenuEntry(value: 'Jakarta', label: 'Jakarta'),
              DropdownMenuEntry(value: 'Jawa Barat', label: 'Jawa Barat'),
              DropdownMenuEntry(value: 'Jawa Timur', label: 'Jawa Timur'),
              DropdownMenuEntry(value: 'Jawa Tengah', label: 'Jawa Tengah'),
            ],
            controller: _provinsiPekerjaanController,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuWidget(
            height: 70,
            label:
            'Tingkat pendidikan apa yg paling tepat/sesuai untuk pekerjaan anda saat ini?',
            listValue: const [
              DropdownMenuEntry(
                  value: 'Setingkat lebih tinggi',
                  label: 'Setingkat lebih tinggi'),
              DropdownMenuEntry(
                  value: 'Tingkat yang sama', label: 'Tingkat yang sama'),
              DropdownMenuEntry(
                  value: 'Setingkat lebih rendah',
                  label: 'Setingkat lebih rendah'),
              DropdownMenuEntry(
                  value: 'Tidak perlu pendidikan tinggi',
                  label: 'Tidak perlu pendidikan tinggi'),
            ],
            controller: _tingkatPendidikanController,
          ),
          const SizedBox(
            height: 20,
          ),
          surveySection(context, 'Studi Lanjutan'),
          const SizedBox(
            height: 20,
          ),
          DropdownMenuWidget(
            height: 70,
            label: 'Studi yang diambil',
            listValue: const [
              DropdownMenuEntry(value: 'S2', label: 'S2'),
              DropdownMenuEntry(value: 'S3', label: 'S3'),
            ],
            controller: _studiDiambilController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Nama program studi yang diambil',
            maxLines: 1,
            controller: _namaProdiDiambilController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldTracerWidget(
            title: 'Nama Kampus',
            maxLines: 1,
            controller: _namaKampusController,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButtonWidget(
            title: 'Masuk',
            width: 250,
            heigth: 55,
            isEnable: true,
            onTap: () {
              _submit();
            },
          )
        ],
      ),
    );
  }
}

Widget surveySection(BuildContext context, String title) {
  return Row(
    children: [
      Container(
        height: 49,
        width: 20,
        decoration: BoxDecoration(color: orangeColor),
      ),
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0558A4), Color(0xff0038FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
        ),
      )
    ],
  );
}