part of 'pages.dart';

class TracerPekerjaanPage extends StatelessWidget {
  const TracerPekerjaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Data Pekerjaan'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical:20),
        children: [
          Wrap(
            runSpacing: 20,
            children: [
              DropdownMenuWidget(height: 70, label: 'Kapan anda memulai mencari pekerjaan?', listValue: [
                DropdownMenuEntry(value: 'Beberapa bulan setelah lulus', label: 'Beberapa bulan setelah lulus'),
                DropdownMenuEntry(value: 'Beberapa bulan setelah lulus', label: 'Beberapa bulan setelah lulus'),
                DropdownMenuEntry(value: 'Saya Tidak Mencari Kerja', label: 'Saya Tidak Mencari Kerja')
              ],),
              DropdownMenuWidget(height: 70, label: 'Apa tingkat tempat kerja Anda?', listValue: [
                DropdownMenuEntry(value: 'Lokal/Wiraswasta tidak berbadan hukum', label: 'Lokal/Wiraswasta tidak berbadan hukum'),
                DropdownMenuEntry(value: 'Lokal/Wiraswasta tidak berbadan hukum', label: 'Lokal/Wiraswasta tidak berbadan hukum'),
                DropdownMenuEntry(value: 'Internasional', label: 'Internasional')
              ]),
              const SizedBox(height: 10,),
              Text('Bagaimana anda mencari pekerjaan tersebut? Jawaban bisa lebih dari satu', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),),
              SizedBox(height: 15,),
              LabeledCheckboxExample(label: 'Mencari pekerjaan melalui iklan koran, majalah, atau brosur.',),
              LabeledCheckboxExample(label: 'Melamar ke perusahaan tanpa mengetahui lowongan yang ada',),
              LabeledCheckboxExample(label: 'Pergi ke bursa/pameran kerja',),
              LabeledCheckboxExample(label: 'Mencari lewat internet/iklan online/milis',),
              LabeledCheckboxExample(label: 'Dihubungi oleh perusahaan',),
              LabeledCheckboxExample(label: 'Menghubungi Kemenakertrans',),
              LabeledCheckboxExample(label: 'Menghubungi agen tenaga kerja komersial/swasta',),
              LabeledCheckboxExample(label: 'Memeroleh informasi dari pusat/kantor pengembangan karir fakultas/universitas',),
              LabeledCheckboxExample(label: 'Menghubungi kantor kemahasiswaan/hubungan alumni',),
              LabeledCheckboxExample(label: 'Membangun jejaring (network) sejak masih kuliah',),
              LabeledCheckboxExample(label: 'Melalui relasi (misalnya dosen, orang tua, saudara, teman, dll.)',),
              LabeledCheckboxExample(label: 'Membangun bisnis sendiri',),
              LabeledCheckboxExample(label: 'Melalui penempatan kerja atau magang',),
              LabeledCheckboxExample(label: 'Bekerja di tempat yang sama dengan tempat kerja semasa kuliah',),
              LabeledCheckboxExample(label: 'Lainnya',),
              DropdownMenuWidget(height: 70, label: 'Pekerjaan anda?', listValue: [
                DropdownMenuEntry(value: 'Belum Bekerja', label: 'Belum bekerja'),
                DropdownMenuEntry(value: 'Karyawan Swasta/Staff', label: 'Karyawan Swasta/Staff'),
                DropdownMenuEntry(value: 'Wirausaha/Pemilik Usaha', label: 'Wirausaha/Pemilik Usaha'),
                DropdownMenuEntry(value: 'First Line Management/Eselon IV', label: 'First Line Management/Eselon IV'),
                DropdownMenuEntry(value: 'Middle Line Management/Eselon III', label: 'Middle Line Management/Eselon III'),
                DropdownMenuEntry(value: 'Top Management/Eselon I dan Eselon II', label: 'Top Management/Eselon I dan Eselon II'),
                DropdownMenuEntry(value: 'Guru', label: 'Guru'),
                DropdownMenuEntry(value: 'Dosen', label: 'Dosen'),
                DropdownMenuEntry(value: 'Melanjutkan Pendidikan', label: 'Melanjutkan Pendidikan'),
              ]),
              DropdownMenuWidget(height: 70, label: 'Berapa range gaji anda ditempat kerja setiap bulan?', listValue: [
                DropdownMenuEntry(value: 'Kurang dari 3 Juta', label: 'Kurang dari 3 Juta'),
                DropdownMenuEntry(value: '3 - 5 Juta', label: '3 - 5 Juta'),
                DropdownMenuEntry(value: '5 – 8 Juta', label: '5 – 8 Juta'),
                DropdownMenuEntry(value: '8 – 10 Juta', label: '8 – 10 Juta'),
                DropdownMenuEntry(value: 'Lebih dari 10 Juta', label: 'Lebih dari 10 Juta'),
              ]),
              DropdownMenuWidget(height: 70, label: 'Jenis perusahaan/instansi tempat anda bekerja?', listValue: [
                DropdownMenuEntry(value: 'Instansi Pemerintah', label: 'Instansi Pemerintah'),
                DropdownMenuEntry(value: 'Organisasi non-profit/Lembaga Swadaya Masyarakat', label: 'Organisasi non-profit/Lembaga Swadaya Masyarakat'),
                DropdownMenuEntry(value: 'Perusahaan swasta', label: 'Perusahaan swasta'),
                DropdownMenuEntry(value: 'Wiraswasta/Bekerja Sendiri', label: 'Wiraswasta/Bekerja Sendiri'),
                DropdownMenuEntry(value: 'BUMN/BUMD', label: 'BUMN/BUMD'),
                DropdownMenuEntry(value: 'Institusi/Organisasi multilateral', label: 'Institusi/Organisasi multilateral'),
                DropdownMenuEntry(value: 'Lainnya', label: 'Lainnya'),
              ]),
              DropdownMenuWidget(height: 70, label: 'Apakah pekerjaan anda sesuai dengan jurusan dan bidang ilmu anda?', listValue: [
                DropdownMenuEntry(value: 'Sesuai', label: 'Sesuai'),
                DropdownMenuEntry(value: 'Tidak Sesuai', label: 'Tidak Sesuai'),
                DropdownMenuEntry(value: 'Netral', label: 'Netral'),
              ]),
              SizedBox(height: 10,),
              DropdownMenuWidget(height: 70, label: 'Provinsi tempat kerja?', listValue: [
                DropdownMenuEntry(value: 'Banten', label: 'Banten'),
                DropdownMenuEntry(value: 'Jakarta', label: 'Jakarta'),
                DropdownMenuEntry(value: 'Jawa Barat', label: 'Jawa Barat'),
                DropdownMenuEntry(value: 'Jawa Timur', label: 'Jawa Timur'),
                DropdownMenuEntry(value: 'Jawa Tengah', label: 'Jawa Tengah'),
              ]),
              DropdownMenuWidget(height: 70, label: 'Tingkat pendidikan apa yg paling tepat/sesuai untuk pekerjaan anda saat ini?', listValue: [
                DropdownMenuEntry(value: 'Setingkat lebih tinggi', label: 'Setingkat lebih tinggi'),
                DropdownMenuEntry(value: 'Tingkat yang sama', label: 'Tingkat yang sama'),
                DropdownMenuEntry(value: 'Setingkat lebih rendah', label: 'Setingkat lebih rendah'),
                DropdownMenuEntry(value: 'Tidak perlu pendidikan tinggi', label: 'Tidak perlu pendidikan tinggi'),
              ]),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             CustomButtonWidget(title: 'Preveous', width: 120,),
             CustomButtonWidget(title: 'Next', width: 120,)
           ],
          )
        ],
      ),
    );
  }
}