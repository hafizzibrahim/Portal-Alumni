part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final String title;
  final bool isEnable;
  const CustomButtonWidget({super.key, this.width = 180, this.heigth = 60, required this.title, this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isEnable? blueColor : softGreyColor
        ),child: Center(child: Text(title, style: isEnable? whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold) : blueTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),)),
      ),
    );
  }
}
