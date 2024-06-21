part of 'widgets.dart';

class DropdownMenuWidget extends StatelessWidget {
  final double height;
  final List<DropdownMenuEntry<String>> listValue;
  final String label;
  final TextEditingController controller;
  const DropdownMenuWidget({super.key, required this.height, required this.label, required this.listValue, required this.controller,});

  @override
  Widget build(BuildContext context) {
    const double padding = 26.0;
    final double availableWidth = MediaQuery.of(context).size.width - (2 * padding);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 14),),
        const SizedBox(height: 10,),
        SizedBox(
          width: availableWidth,
          child: DropdownMenu<String>(
            controller: controller,
            width: availableWidth,
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
        ),
      ],
    );
  }
}
