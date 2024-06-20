part of 'widgets.dart';

class ArticleWigets extends StatelessWidget {
  final String imageUrl;
  final String articleImageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String date;
  final String time;

  const ArticleWigets({super.key, required this.title, required this.subtitle, required this.description, required this.imageUrl, required this.date, required this.time, required this.articleImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    imageUrl,
                    //'assets/images/profile_photo.png',
                    scale: 4,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                  child: Text(
                subtitle,
                maxLines: 1,
                style: blackTextStyle.copyWith(
                    fontSize: 11, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 3,),
              SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text(
                    description,
                    maxLines: 2,
                    style: blackTextStyle.copyWith(
                        fontSize: 11, fontWeight: reguler, overflow: TextOverflow.ellipsis,),
                  )),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(date, style: greyTextStyle.copyWith(fontSize: 10),),
                  const SizedBox(width: 5,),
                  Icon(Icons.circle_rounded, size: 5, color: greyColor,),
                  const SizedBox(width: 5,),
                  Text(time, style: greyTextStyle.copyWith(fontSize: 10))
                ],
              )
            ],
          ),
          Image.asset(articleImageUrl, scale: 1.7,)
        ],
      ),
    );
  }
}
