part of 'pages.dart';

class TracerBiodataPage extends StatelessWidget {
  const TracerBiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Data Biodata'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
          SizedBox(height: 16,),
          TextFieldTracerWidget(title: 'Nama', maxLines: 1),
          SizedBox(height: 16,),
          TextFieldTracerWidget(title: 'NIM', maxLines: 1),
          SizedBox(height: 16,),
          TextFieldTracerWidget(title: 'Email Kampus', maxLines: 1),
          SizedBox(height: 16,),
          TextFieldTracerWidget(title: 'Email Pribadi', maxLines: 1),
          SizedBox(height: 16,),
          TextFieldTracerWidget(title: 'No Handphone / WhatsApp', maxLines: 1),
          SizedBox(height: 32,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(title: 'Next', width: 120,),
            ],
          )
        ],
      ),
    );
  }
}
