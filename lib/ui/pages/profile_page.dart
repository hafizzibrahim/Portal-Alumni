part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [Color(0xFF5356FF), Color(0xFF221FBB)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 35,
                      color: whiteColor,
                    ),
                  ),
                ),
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
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          textField('Nama Lengkap', 'Mulyadi'),
          textField('Nim', '33372xxxxx'),
          textField('Fakultas', 'Teknik'),
          textField('Jurusan', 'Informatika'),
          textField('Tahun Lulus', '2025'),
        ],
      ),
    );
  }

  Widget textField(String title, String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
