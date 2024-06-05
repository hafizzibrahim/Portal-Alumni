part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final String title;
  const CustomButtonWidget({super.key, this.width = 180, this.heigth = 60, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: blueColor
        ),child: Center(child: Text(title, style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),)),
      ),
    );
  }
}
