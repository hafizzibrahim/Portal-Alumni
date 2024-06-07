part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final String title;
  final VoidCallback onTap;
  const CustomButtonWidget({super.key, this.width = 180, this.heigth = 60, required this.title, required bool isEnable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
