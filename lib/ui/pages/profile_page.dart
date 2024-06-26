part of 'pages.dart';

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
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final currentUser = snapshot.data!;
                  return Column(
                    children: [
                      profileHeader(currentUser),
                      SizedBox(height: 40),
                      textField('Nama Lengkap', currentUser.nama.toString()),
                      textField('Nim', currentUser.nim.toString()),
                      textField('Fakultas', currentUser.fakultas),
                      textField('Jurusan', currentUser.jurusan),
                      textField('Tahun Lulus', currentUser.tahunLulus.toString()),
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
          colors: [lightBlue, darkBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            // Menampilkan gambar dari URL
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                user.imagePath,
                scale: 6,
              ),
            ),
            SizedBox(height: 20),
            Text(
              user.nama, // Menampilkan nama dari data pengguna
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              user.email, // Menampilkan email dari data pengguna
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }


  Widget textField(String title, String value, {String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: initialValue ?? value,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}