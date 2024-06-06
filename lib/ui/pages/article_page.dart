part of 'pages.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [lightBlue, darkBlue]),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(25))),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'Article',
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 20),
              ),
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: whiteColor,
                  )),
            )),
      ),
      backgroundColor: whiteblueColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 17),
        children: [
          SearchTextFieldWidget(
            suffixIcon: Icon(
              Icons.search,
              color: darkBlue,
              size: 26,
            ),
            labelText: 'Search',
          ),
          const SizedBox(
            height: 21,
          ),
          const ArticleWigets(
              title: 'Nurdin',
              subtitle: '3 Nutrisi Penting yang Dibutuhkan Oleh  Pelari',
              description:
                  'Itu adalah faktor penting yang harus adalah faktor penting yang harus.....',
              imageUrl: 'assets/images/profile_photo.png',
              date: '12 Mar',
              time: '5 min',
              articleImageUrl: 'assets/images/img_article_example.png'),
          const SizedBox(
            height: 21,
          ),
          const ArticleWigets(
              title: 'Nurdin',
              subtitle: '3 Nutrisi Penting yang Dibutuhkan Oleh  Pelari',
              description:
              'Itu adalah faktor penting yang harus adalah faktor penting yang harus.....',
              imageUrl: 'assets/images/profile_photo.png',
              date: '12 Mar',
              time: '5 min',
              articleImageUrl: 'assets/images/img_article_example.png'),
          const SizedBox(
            height: 21,
          ),
          const ArticleWigets(
              title: 'Nurdin',
              subtitle: '3 Nutrisi Penting yang Dibutuhkan Oleh  Pelari',
              description:
              'Itu adalah faktor penting yang harus adalah faktor penting yang harus.....',
              imageUrl: 'assets/images/profile_photo.png',
              date: '12 Mar',
              time: '5 min',
              articleImageUrl: 'assets/images/img_article_example.png'),
          const SizedBox(
            height: 21,
          ),
          const ArticleWigets(
              title: 'Nurdin',
              subtitle: '3 Nutrisi Penting yang Dibutuhkan Oleh  Pelari',
              description:
              'Itu adalah faktor penting yang harus adalah faktor penting yang harus.....',
              imageUrl: 'assets/images/profile_photo.png',
              date: '12 Mar',
              time: '5 min',
              articleImageUrl: 'assets/images/img_article_example.png'),
        ],
      ),
    );
  }
}
