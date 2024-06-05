part of 'pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
                  color: blueColor,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/img_background_login.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 30,
                      right: 0,
                        child: Image.asset('assets/images/img_untirta_outlined.png', scale: 2,))
                  ],
                ),
              ),
              Positioned(
                top: 200,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: greyColor,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/icons/ic_logo_untirta.png', scale: 1.5,),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Selamat Datang',
                          style: blueTextStyle.copyWith(
                              fontSize: 22, fontWeight: extraBold),
                        ),
                        Text(
                          'Di Portal Alumni',
                          style: blackTextStyle.copyWith(
                              fontSize: 17, fontWeight: extraBold),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const CustomTextFieldWidget(
                          label: 'Email',
                          icon: Icon(Icons.email_rounded),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CustomTextFieldWidget(
                          label: 'Email',
                          icon: Icon(Icons.lock),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const CustomButtonWidget(
                          title: 'Masuk',
                          width: 250,
                          heigth: 55,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
