part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo Mulyadi!',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      ),
                      Text(
                        'Selamat Datang di Portal ALumni',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/profile_photo.png',
                  scale: 2.5,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            'Recent Career',
            style: blackTextStyle.copyWith(fontSize: 12),
          ),
          bannerSlider(context),
          const SizedBox(
            height: 55,
          ),
          Text(
            'Shortcut',
            style: blackTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              shortcutWidget('assets/icons/ic_article.png', context, 'Article'),
              shortcutWidget(
                  'assets/icons/ic_dashboard.png', context, 'Dashboard'),
              shortcutWidget('assets/icons/ic_career.png', context, 'Career')
            ],
          ),
          const SizedBox(
            height: 55,
          ),
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
          )
        ],
      ),
    );
  }

  Widget bannerSlider(BuildContext context) {
    return CarouselSlider(
      items: [
        'assets/images/img_career_banner.png',
        'assets/images/img_career_banner.png',
        'assets/images/img_career_banner.png',
      ].map((imagePath) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: AssetImage(imagePath),
              //fit: BoxFit.fill,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget shortcutWidget(String icon, BuildContext context, String title) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEAEBFF),
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(-2, 3),
                    color: greyColor),
                BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(2, -3),
                    color: whiteColor),
              ]),
          child: Image.asset(
            icon,
            scale: 2.5,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
        )
      ],
    );
  }
}
