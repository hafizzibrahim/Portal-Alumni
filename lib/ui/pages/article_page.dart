part of 'pages.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleViewModel>(context, listen: false);

    // Panggil fetchJobs saat ArticlePage pertama kali dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getArticle();
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [lightBlue, darkBlue]),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 23),
            child: SearchTextFieldWidget(
              suffixIcon: Icon(
                Icons.search,
                color: darkBlue,
                size: 26,
              ),
              labelText: 'Search',
              onChanged: (query) {
                viewModel.updateSearchArticleQuery(query);
              },
            ),
          ),
          Expanded(
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
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 17),
                    itemCount: viewModel.articles.length,
                    itemBuilder: (context, index) {
                      final article = viewModel.articles[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(
                                    title: article.title,
                                    content: article.content,
                                  ),
                                ),
                              );
                            },
                            child: ArticleWigets(
                              title: 'Nurdin', // Ganti dengan data sesuai artikel
                              subtitle: article.title,
                              description: article.content,
                              imageUrl: 'assets/images/profile_photo.png', // Ganti dengan gambar profil
                              date: '12 Mar', // Ganti dengan tanggal artikel
                              time: '5 min', // Ganti dengan estimasi waktu baca
                              articleImageUrl: 'assets/images/img_article_example.png', // Ganti dengan gambar artikel
                            ),
                          ),
                          const SizedBox(height: 21),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
