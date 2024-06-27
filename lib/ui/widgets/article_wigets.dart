part of 'widgets.dart';

class ArticleWigets extends StatelessWidget {
  final String articleImageUrl;
  final String subtitle;
  final String description;
  final String date;
  final String time;

  const ArticleWigets({
    Key? key,
    required this.subtitle,
    required this.description,
    required this.date,
    required this.time,
    required this.articleImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  subtitle,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(date, style: TextStyle(fontSize: 10)),
                  const SizedBox(width: 5),
                  Icon(Icons.circle_rounded, size: 5),
                  const SizedBox(width: 5),
                  Text(time, style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              articleImageUrl,
              width: 116, // Sesuaikan ukuran gambar artikel sesuai kebutuhan Anda
              height: 116,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
