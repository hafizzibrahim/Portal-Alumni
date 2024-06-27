part of 'pages.dart';

class CareerDetailPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? content;
  final String? income;
  final String? imagepath;

  const CareerDetailPage({
    super.key,
    this.title,
    this.description,
    this.content,
    this.income, this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
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
              'Untirta Career',
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
        padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 20),
        children: [
          titleCareer(),
          const SizedBox(
            height: 20,
          ),
          detailCareer(description!, content!)
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: CustomButtonWidget(
          title: 'Kunjungi',
        ),
      ),
    );
  }

  Widget titleCareer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imagepath!,
            height: 128,
            width: 128,
          ),
          Text(
            title!,
            style: blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
          ),
          Text(
            'National Aeronautics',
            style: greyTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
          Text(
            'Washington D.C, U.S.A',
            style: greyTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
          ),
        ],
      ),
    );
  }

  Widget detailCareer(String desc, String _desc) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 60, bottom: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'APPLY BEFORE',
                    style: blackTextStyle.copyWith(fontSize: 11, fontWeight: bold),
                  ),
                  Text(
                    '30 July, 2024',
                    style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Salary Range',
                    style: blackTextStyle.copyWith(fontSize: 11, fontWeight: bold),
                  ),
                  Text(
                    income!,
                    style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Nature',
                    style: blackTextStyle.copyWith(fontSize: 11, fontWeight: bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightBlue,
                    ),
                    child: Text(
                      'Contractual',
                      style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Job Location',
                    style: blackTextStyle.copyWith(fontSize: 11, fontWeight: bold),
                  ),
                  Text(
                    'On-Site',
                    style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'JOB DESCRIPTION',
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 11),
          ),
          ReadMoreHtml(
            data: desc,
            style: blackTextStyle.copyWith(fontSize: 11, fontWeight: reguler),
            lessStyle: TextStyle(fontSize: 11, fontWeight: bold, color: lightBlue),
            moreStyle: TextStyle(fontWeight: bold, color: lightBlue),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Roles AND RESPONSIBILITIES',
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 11),
          ),
          ReadMoreHtml(
            data: _desc,
            style: blackTextStyle.copyWith(fontSize: 11, fontWeight: reguler),
            lessStyle: TextStyle(fontSize: 11, fontWeight: bold, color: lightBlue),
            moreStyle: TextStyle(fontWeight: bold, color: lightBlue),
          ),
        ],
      ),
    );
  }
}

class ReadMoreHtml extends StatelessWidget {
  final String data;
  final int trimLines;
  final TextStyle style;
  final TextStyle lessStyle;
  final TextStyle moreStyle;

  const ReadMoreHtml({
    required this.data,
    this.trimLines = 3,
    required this.style,
    required this.lessStyle,
    required this.moreStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      data,
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: '...Show More',
      trimExpandedText: ' Show Less',
      lessStyle: lessStyle,
      moreStyle: moreStyle,
      style: style,
      textAlign: TextAlign.justify,
    );
  }
}

