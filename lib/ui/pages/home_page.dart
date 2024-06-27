part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleViewModel>(context, listen: false);

    // Call fetchJobs when ArticlePage is first built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      viewModel.getArticles();
    });

    return Scaffold(
      backgroundColor: whiteblueColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
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
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Halo ${currentUser.nama}!',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Selamat Datang di Portal Alumni',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              currentUser.imagePath,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Recent Career',
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            bannerSlider(context),
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Shortcut',
                style: blackTextStyle.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  shortcutWidget(
                    'assets/icons/ic_article.png',
                    context,
                    'Article',
                        () {
                      Navigator.pushNamed(context, '/article-page');
                    },
                  ),
                  shortcutWidget(
                    'assets/icons/ic_dashboard.png',
                    context,
                    'Dashboard',
                        () {
                      Navigator.pushNamed(context, '/dashboard-page');
                    },
                  ),
                  shortcutWidget(
                    'assets/icons/ic_career.png',
                    context,
                    'Career',
                        () {
                      Navigator.pushNamed(context, '/career-page');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/article-page');
                  },
                  child: Text(
                    'Lihat Semua',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<ArticleViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (viewModel.articles.isEmpty) {
                    return Center(
                      child: Text(
                        'No articles found.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  } else {
                    final latestArticles = viewModel.articles.take(3).toList();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: latestArticles.map((article) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleDetailPage(
                                      title: article.title,
                                      content: article.content, imagePath: article.imagePath,
                                    ),
                                  ),
                                );
                              },
                              child: ArticleWigets(
                                subtitle: article.title,
                                description: article.content,
                                date: '12 Mar',
                                time: '5 min',
                                articleImageUrl: article.imagePath,
                              ),
                            ),
                            const SizedBox(height: 21),
                          ],
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
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

  Widget shortcutWidget(String icon, BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
                  color: greyColor,
                ),
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(2, -3),
                  color: whiteColor,
                ),
              ],
            ),
            child: Image.asset(
              icon,
              scale: 2.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}