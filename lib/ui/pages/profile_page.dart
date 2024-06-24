part of 'pages.dart';
// Ganti dengan path yang sesuai

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      body: SingleChildScrollView(
        child: Consumer<LoginViewModel>(
          builder: (context, loginViewModel, _) {
            return FutureBuilder<UserModel>(
              future: loginViewModel.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final currentUser = snapshot.data!;
                  return Column(
                    children: [
                      profileHeader(currentUser),
                      SizedBox(height: 40),
                      textField('Nama Lengkap', 'Mulyadi'), // Ganti dengan data dari API jika tersedia
                      textField('Nim', '33372xxxxx'), // Ganti dengan data dari API jika tersedia
                      textField('Fakultas', 'Teknik'), // Ganti dengan data dari API jika tersedia
                      textField('Jurusan', 'Informatika'), // Ganti dengan data dari API jika tersedia
                      textField('Tahun Lulus', '2025'), // Ganti dengan data dari API jika tersedia
                      SizedBox(height: 16),
                      CustomButtonWidget(
                        title: 'Keluar',
                        width: 140,
                        heigth: 40,
                        onTap: () => _logout(context),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    await Provider.of<LoginViewModel>(context, listen: false).logout();
    Navigator.pushReplacementNamed(context, '/login-page');
  }

  Widget profileHeader(UserModel user) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF5356FF), Color(0xFF221FBB)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Image.asset(
              'assets/images/profile_photo.png',
              scale: 1.5,
            ),
            SizedBox(height: 20),
            Text(
              'Mulyadi', // Ganti dengan nama dari data pengguna
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Sesuaikan dengan gaya teks yang Anda inginkan
            ),
            Text(
              user.email, // Menampilkan email dari data pengguna
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white), // Sesuaikan dengan gaya teks yang Anda inginkan
            )
          ],
        ),
      ),
    );
  }

  Widget textField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), // Sesuaikan dengan gaya teks yang Anda inginkan
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: value,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: whiteColor, // Sesuaikan dengan warna latar belakang yang Anda inginkan
            ),
          ),
        ],
      ),
    );
  }
}