part of 'pages.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleViewModel>(context, listen: false);

    // Panggil fetchArticles saat ArticlePage pertama kali dibangun
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      viewModel.getArticles();
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
                        color: blackColor,
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
                                    imagePath: article.imagePath,
                                  ),
                                ),
                              );
                            },
                            child: ArticleWigets(
                              subtitle: article.title,
                              description: article.content,
                              date: '12 Mar', // Contoh tanggal
                              time: '5 min', // Contoh estimasi waktu baca
                              articleImageUrl: article.imagePath, // URL gambar artikel
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