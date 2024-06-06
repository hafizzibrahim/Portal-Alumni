part of 'widgets.dart';

class TextFieldTracerWidget extends StatelessWidget {
  final String title;
  final int maxLines;
  const TextFieldTracerWidget({super.key, required this.title, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),),
        SizedBox(height: 8,),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: greyColor)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: greyColor)
            ),
          ),
        ),
      ],
    );
  }
}
