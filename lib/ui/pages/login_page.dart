part of 'pages.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    try {
      await Provider.of<LoginViewModel>(context, listen: false).login(email, password);

      // Show success dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Login Successful',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Welcome to Portal Alumni !!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pushNamed(context, '/main-page');
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Login Error: $e');
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Login Failed',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            color: blueColor,
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/img_background_login.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 30,
                right: 0,
                child: Image.asset(
                  'assets/images/img_untirta_outlined.png',
                  scale: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/ic_logo_untirta.png',
                  scale: 1.5,
                ),
                SizedBox(height: 24),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Di Portal Alumni',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextfieldWidget(
                  controller: _emailController,
                  label: 'Email',
                  obscureText: false,
                  icon: const Icon(Icons.email_rounded),
                ),
                SizedBox(height: 16),
                TextfieldWidget(
                  controller: _passwordController,
                  label: 'Email',
                  obscureText: true,
                  icon: const Icon(Icons.email_rounded),
                ),
                SizedBox(height: 32),
                CustomButtonWidget(
                  title: 'Masuk',
                  width: 250,
                  heigth: 55,
                  isEnable: true,
                  onTap: () => _login(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextfieldWidget extends StatefulWidget {
  final String label;
  final bool obscureText;
  late bool isVisible;
  final Icon icon;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  TextfieldWidget(
      {super.key,
      required this.label,
      this.obscureText = true,
      this.isVisible = true,
      this.onTap,
      required this.icon, this.controller});

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //height: 45,
          child: TextFormField(
            controller: widget.controller,
            obscureText:
                widget.isVisible ? widget.obscureText : widget.isVisible,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: blackColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: softGreyColor, width: 1),
                ),
                hintText: widget.label,
                prefixIcon: widget.icon,
                suffixIcon: widget.obscureText
                    ? GestureDetector(
                        onTap: () {
                          if (widget.isVisible == false) {
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
