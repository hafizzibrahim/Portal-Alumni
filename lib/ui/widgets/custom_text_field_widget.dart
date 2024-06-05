part of 'widgets.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final Icon? icon;
  final bool obscureText;
  const CustomTextFieldWidget({super.key, required this.label, this.icon, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
      obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
            borderRadius: BorderRadius.circular(14)
          ),
          prefixIcon: icon,
          labelText: label,
        ),
      ),
    );
  }
}
