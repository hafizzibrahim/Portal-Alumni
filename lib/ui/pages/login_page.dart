part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      await login(email, password);
      Navigator.pushNamed(context, '/main-page');
    } catch (e) {
      print('Login Error: $e');
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Login Failed'),
                content: Text(e.toString()),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
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
                  ))
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
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Selamat Datang',
                  style: blueTextStyle.copyWith(
                      fontSize: 22, fontWeight: extraBold),
                ),
                Text(
                  'Di Portal Alumni',
                  style: blackTextStyle.copyWith(
                      fontSize: 17, fontWeight: extraBold),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextfieldWidget(
                  controller: _emailController,
                  label: 'Email',
                  obscureText: false,
                  icon: const Icon(Icons.email_rounded),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextfieldWidget(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButtonWidget(
                  title: 'Masuk',
                  width: 250,
                  heigth: 55,
                  isEnable: true,
                  onTap: _login,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> login(String email, String password) async {
  final url = '#########################';
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'aplication/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    if (responseData['data'] != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseData['data']['token']);
      await prefs.setString('userId', responseData['data']['id']);
      await prefs.setString('email', responseData['data']['email']);
      print('Login successful');
    } else {
      throw Exception('Failed to parse response');
    }
  } else {
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    throw Exception('Failed to login');
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
