part of 'pages.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

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
                'Untirta Career',
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
      backgroundColor: whiteblueColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 17),
        children: [
          SearchTextFieldWidget(
            prefixIcon: Icon(
              Icons.search,
              color: darkBlue,
              size: 26,
            ),
            suffixIcon: Icon(
              Icons.filter_alt_outlined,
              color: darkBlue,
              size: 26,
            ),
            labelText: 'Search',
          ),
          const SizedBox(
            height: 21,
          ),
          const CustomCard2Widget(
            title: 'Head Rocket Engineer',
            subTitle: 'National Aeronautics And Space Administration',
            subTitle2: 'Washington D.C, U.S.A',
            income: '\$20k - \$50k',
          ),
          const SizedBox(height: 20,),
          const CustomCard2Widget(
            title: 'Head Rocket Engineer',
            subTitle: 'National Aeronautics And Space Administration',
            subTitle2: 'Washington D.C, U.S.A',
            income: '\$20k - \$50k',
          )
        ],
      ),
    );
  }
}

class CustomCard2Widget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle2;
  final String income;
  const CustomCard2Widget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.subTitle2,
      required this.income});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/images/img_nasa.png',
                scale: 1.2,
              )),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      subTitle,
                      style: blackTextStyle.copyWith(
                          fontWeight: reguler, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      subTitle2,
                      style: blackTextStyle.copyWith(
                          fontWeight: light, fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: lightBlue2,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Full Time',
                      style: blueTextStyle.copyWith(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: lightBlue2,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'On Site',
                      style: blueTextStyle.copyWith(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    income,
                    style:
                        blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  Text(
                    '\\month',
                    style: greyTextStyle.copyWith(
                        fontSize: 10, fontWeight: reguler),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
