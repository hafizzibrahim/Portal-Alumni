part of 'pages.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
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
                'Dashboard',
                style:
                    whiteTextStyle.copyWith(fontWeight: medium, fontSize: 20),
              ),
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: whiteColor,
                  )),
            )),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                    color: greyColor),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Text(
                        'Dashboard Tracer Study Untirta',
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: extraBold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Platform digital ini menghubungkan lulusan, memfasilitasi komunikasi, dan menyediakan informasi bermanfaat bagi alumni.',
                        style: blackTextStyle.copyWith(
                            fontSize: 10, fontWeight: reguler),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: softGreyColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                          color: greyColor),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Statistic',
                            style: greyTextStyle.copyWith(
                                fontSize: 10, fontWeight: medium),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '85,250',
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '2.8%',
                            style: greenTextStyle.copyWith(
                                fontSize: 7, fontWeight: medium),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/dummy_chart.png',
                        scale: 2.5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/dummy_line_chart.png'),
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text('Lihat Semua',
                      style: greyTextStyle.copyWith(fontSize: 12)))),
          const ArticleWigets(
            imageUrl: 'assets/images/profile_photo.png',
            title: 'Mulyadi',
            subtitle: '3 Nutrisi Penting yang Dibutuhkan Oleh  Pelari',
            description:
                'Itu adalah faktor penting yang harus adalah faktor penting yang harus aksdnkfkdnfkns',
            date: '12 Mar',
            time: '5 min',
            articleImageUrl: 'assets/images/img_article_example.png',
          ),
        ],
      ),
    );
  }
}
