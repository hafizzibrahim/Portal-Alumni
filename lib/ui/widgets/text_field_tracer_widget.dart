part of 'widgets.dart';

class TextFieldTracerWidget extends StatelessWidget {
  final String title;
  final int maxLines;
  final TextEditingController controller;
  const TextFieldTracerWidget({super.key, required this.title, required this.maxLines, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),),
        const SizedBox(height: 8,),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}
