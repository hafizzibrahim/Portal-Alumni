part of 'pages.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleViewmodel>(context, listen: false);

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
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: whiteColor,
                  )
              ),
            )),
      ),
      backgroundColor: whiteblueColor,
      body: Consumer<ArticleViewmodel>(
        builder: (context, viewModel, children) {
          if (viewModel.articles.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
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
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 17),
                    itemCount: viewModel.articles.length,
                    itemBuilder: (context, index) {
                      final article = viewModel.articles[index];
                      return
                        Column(
                          children: [
                            ArticleWigets(
                                title: 'Nurdin',
                                subtitle: article.title,
                                description:
                                article.content,
                                imageUrl: 'assets/images/profile_photo.png',
                                date: '12 Mar',
                                time: '5 min',
                                articleImageUrl: 'assets/images/img_article_example.png'),
                            const SizedBox(
                              height: 21,
                            ),
                  
                          ],
                        );
                    }
                  ),
                ),
              ],
            );
          }
        },
      )
    );
  }
}
