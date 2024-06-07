part of 'pages.dart';

class TracerWisudaPage extends StatelessWidget {
  const TracerWisudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: AppBar(
        title: const Text('Data Wisuda'),
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
                Expanded(child: Divider(color: blueColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
                Expanded(child: Divider(color: softGreyColor, thickness: 5,)),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Tahun Masuk', maxLines: 1),
          const SizedBox(height: 16,),
          const TextFieldTracerWidget(title: 'Tahun Lulus', maxLines: 1),
          const SizedBox(height: 16,),


        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonWidget(title: 'Previous', width: 120, isEnable: false, onTap: () {  },),
            CustomButtonWidget(title: 'Next', width: 120, isEnable: true, onTap: () {  },),
          ],
        ),
      ),
    );
  }
}
