part of 'widgets.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final Color fillColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String labelText;
  const SearchTextFieldWidget({super.key, this.fillColor = const Color(0xffffffff), this.suffixIcon, required this.labelText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
      ),
    );
  }
}