import 'package:flutter/material.dart';
import 'package:portal_alumni_v1/shared/shared.dart';
import 'package:portal_alumni_v1/ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
              backgroundColor: whiteColor,
              elevation: 0,
              iconTheme: IconThemeData(color: blackColor),
              centerTitle: true,
              titleTextStyle:
              blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold)
          )
      ),
      routes: {
        '/': (context) => MainPage(),

        '/login-page': (context) => const LoginPage(),
        '/main-page': (context) => MainPage(),
        '/home-page' : (context) => HomePage(),
        '/profile-page' : (context) => ProfilePage()
      },
    );
  }
}