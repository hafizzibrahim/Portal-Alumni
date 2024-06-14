part of 'pages.dart';

class TracerStudiLanjutPage extends StatelessWidget {
  const TracerStudiLanjutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: AppBar(
        title: const Text('Data Studi Lanjut'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        children: [
          Row(
            children: [
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
              Expanded(child: Divider(color: blueColor, thickness: 5,)),
            ],
          ),
          const SizedBox(height: 16,),
          const DropdownMenuWidget(height: 70, label: 'Studi yang diambil', listValue: [
            DropdownMenuEntry(value: 'Hukum', label: 'Hukum'),
            DropdownMenuEntry(value: 'Keguruan dan Ilmu Pendidikan', label: 'Keguruan dan Ilmu Pendidikan'),
            DropdownMenuEntry(value: 'Teknik', label: 'Teknik'),
            DropdownMenuEntry(value: 'Pertanian', label: 'Pertanian'),
            DropdownMenuEntry(value: 'Ilmu Sosial dan Ilmu Politik', label: 'Ilmu Sosial dan Ilmu Politik'),
          ]),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Nama program studi yang diambil', maxLines: 1),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Nama Kampus', maxLines: 1),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonWidget(title: 'Previous', width: 120, isEnable: false, onTap: () { Navigator.pushNamed(context, '/tracer-pekerjaan-page'); },),
            CustomButtonWidget(title: 'Next', width: 120, isEnable: true, onTap: () { Navigator.pushNamed(context, '/tracer-study-selesai-page'); },),
          ],
        ),
      ),
    );
  }
}
