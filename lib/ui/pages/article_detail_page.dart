part of 'pages.dart';

class ArticleDetailPage extends StatelessWidget {
  final String? title;
  final String? content;
  final String? imagePath;

  const ArticleDetailPage({Key? key, this.title, this.content, this.imagePath})
      : super(key: key);

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
                const BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Article',
              style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 20),
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: whiteblueColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        children: [
          // Contoh tampilan profil penulis artikel
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/img_profile_article.png',
                  width: 36,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmad Nurdin',
                    style: blackTextStyle.copyWith(
                        fontSize: 10, fontWeight: medium),
                  ),
                  Text(
                    'Psikolog',
                    style:
                        blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              imageUrl: imagePath ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          const SizedBox(height: 16),
          Text(
            title ?? '',
            style: blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                '3 days ago',
                style: greyTextStyle.copyWith(fontSize: 10),
              ),
              const SizedBox(width: 5),
              Icon(Icons.circle_rounded, size: 5, color: greyColor),
              const SizedBox(width: 5),
              Text(
                '5 min',
                style: greyTextStyle.copyWith(fontSize: 10),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content ?? '',
            style: blackTextStyle.copyWith(fontWeight: reguler, fontSize: 14),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
