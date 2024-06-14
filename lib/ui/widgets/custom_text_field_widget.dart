part of 'widgets.dart';

class CostumTextFieldWidget extends StatefulWidget {
  final String title;
  final bool obscureText;
  late bool isVisible;
  final VoidCallback? onTap;
  CostumTextFieldWidget(
      {super.key,
        required this.title,
        this.obscureText = true,
        this.isVisible = false, this.onTap});

  @override
  State<CostumTextFieldWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<CostumTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //height: 45,
          child: TextFormField(
            obscureText: widget.isVisible?widget.obscureText:widget.isVisible,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: blackColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: softGreyColor, width: 1),
                ),
                suffixIcon: widget.obscureText
                    ? GestureDetector(
                    onTap: () {
                      if(widget.isVisible == false) {
                        setState(() {
                          widget.isVisible = true;
                        });
                      } else {
                        setState(() {
                          widget.isVisible = false;
                        });
                      }
                    },
                    child: Icon(widget.isVisible
                        ? Icons.visibility_off
                        : Icons.visibility))
                    : null),
          ),
        ),
      ],
    );
  }
}
