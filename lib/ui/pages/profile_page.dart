part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileHeader(context),
            const SizedBox(height: 40,),
            textField('Nama Lengkap', 'Mulyadi'),
            textField('Nim', '33372xxxxx'),
            textField('Fakultas', 'Teknik'),
            textField('Jurusan', 'Informatika'),
            textField('Tahun Lulus', '2025'),
            SizedBox(height: 16,),
            CustomButtonWidget(
                title: 'Keluar',
                width: 140,
                heigth: 40,
                onTap: () => _logout(context)
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    // Call the logout function from LoginViewModel
    await Provider.of<LoginViewModel>(context, listen: false).logout();

    // Navigate to the login page
    Navigator.pushReplacementNamed(context, '/login-page');
  }

  Widget profileHeader(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          gradient: LinearGradient(
              colors: [Color(0xFF5356FF), Color(0xFF221FBB)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/profile_photo.png',
              scale: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Mulyadi',
              style:
              whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            Text(
              '33372xxxxx@untirta.ac.id',
              style: whiteTextStyle.copyWith(
                  fontSize: 13, fontWeight: reguler),
            )
          ],
        ),
      ),
    );
  }

  Widget textField(String title, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: name,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
