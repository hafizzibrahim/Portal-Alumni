part of 'pages.dart';

class TracerStudySelesaiPage extends StatelessWidget {
  const TracerStudySelesaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text('# P O R T A L  A L U M N I', style: blueTextStyle.copyWith(fontSize: 15, fontWeight: medium),),
                ),
                SizedBox(height: 16,),
                Text('Terima Kasih', style: blueTextStyle.copyWith(fontSize: 28, fontWeight: bold),),
                SizedBox(height: 8,),
                Text('Sudah Mengisi Form \nSukses Selalu !', style: blackTextStyle.copyWith(fontSize: 26, fontWeight: semiBold),),
                SizedBox(height: 32,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/main-page');},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueColor
                    ), child: Text('Kembali', style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: bold),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Image.asset('assets/images/img_background_tracer.png',)
        ],
      ),
    );
  }
}
