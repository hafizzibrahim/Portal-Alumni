part of 'widgets.dart';

class DropdownMenuWidget extends StatelessWidget {
  final double height;
  final List<DropdownMenuEntry<String>> listValue;
  final String label;
  const DropdownMenuWidget({super.key, required this.height, required this.label, required this.listValue,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
        const SizedBox(height: 10,),
        DropdownMenu<String>(
          width: MediaQuery.of(context).size.width,
          enableSearch: false,
          dropdownMenuEntries: listValue,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14)
            )
          ),
        ),
      ],
    );
  }
}
