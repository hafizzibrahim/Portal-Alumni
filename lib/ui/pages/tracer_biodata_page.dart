part of 'pages.dart';

class TracerBiodataPage extends StatelessWidget {
  const TracerBiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: AppBar(
        title: const Text('Data Biodata'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
            child: Row(
              children: [
                Expanded(child: Divider(color: blueColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Nama', maxLines: 1),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'NIM', maxLines: 1),
          const SizedBox(height: 16,),
          const DropdownMenuWidget(height: 70, label: 'Faklutas', listValue: [
            DropdownMenuEntry(value: 'Hukum', label: 'Hukum'),
            DropdownMenuEntry(value: 'Keguruan dan Ilmu Pendidikan', label: 'Keguruan dan Ilmu Pendidikan'),
            DropdownMenuEntry(value: 'Teknik', label: 'Teknik'),
            DropdownMenuEntry(value: 'Pertanian', label: 'Pertanian'),
            DropdownMenuEntry(value: 'Ilmu Sosial dan Ilmu Politik', label: 'Ilmu Sosial dan Ilmu Politik'),
          ]),
          SizedBox(height: 16,),
          const DropdownMenuWidget(height: 70, label: 'Program Studi', listValue: [
            DropdownMenuEntry(value: 'Hukum', label: 'Hukum'),
            DropdownMenuEntry(value: 'Keguruan dan Ilmu Pendidikan', label: 'Keguruan dan Ilmu Pendidikan'),
            DropdownMenuEntry(value: 'Teknik', label: 'Teknik'),
            DropdownMenuEntry(value: 'Pertanian', label: 'Pertanian'),
            DropdownMenuEntry(value: 'Ilmu Sosial dan Ilmu Politik', label: 'Ilmu Sosial dan Ilmu Politik'),
          ]),
          SizedBox(height: 16,),
          const DropdownMenuWidget(height: 70, label: 'Jenis Kelamin', listValue: [
            DropdownMenuEntry(value: 'Lanang', label: 'Lanang'),
            DropdownMenuEntry(value: 'Wadong', label: 'Wadon'),
          ]),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Email Kampus', maxLines: 1),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Email Pribadi', maxLines: 1),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'No Handphone / WhatsApp', maxLines: 1),
          const SizedBox(height: 32,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(title: 'Next', width: 120, isEnable: true, onTap: () { Navigator.pushNamed(context, '/tracer-wisuda-page'); },),
            ],
          )
        ],
      ),
    );
  }
}
