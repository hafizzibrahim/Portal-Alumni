part of 'pages.dart';

class TracerStudyPage extends StatelessWidget {
  const TracerStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 48, bottom: 75),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(35)
              ),
              child: Column(
                children: [
                  Image.asset('assets/icons/ic_logo_untirta.png', scale: 1.5,),
                  const SizedBox(height: 12,),
                  Text('Selamat Datang', style: blueTextStyle.copyWith(fontWeight: extraBold, fontSize: 22),),
                  Text('Di Tracer Study', style: blackTextStyle.copyWith(fontWeight: extraBold, fontSize: 17),),
                  const SizedBox(height: 32,),
                  CustomButtonWidget(title: 'Mulai', width: 175, heigth: 48, isEnable: true, onTap: (){},)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
