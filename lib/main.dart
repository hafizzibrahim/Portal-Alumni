import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portal_alumni_v1/shared/shared.dart';
import 'package:portal_alumni_v1/ui/pages/pages.dart';
import 'package:portal_alumni_v1/viewmodels/careerpage_viewmodel.dart';
import 'package:portal_alumni_v1/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Bypass SSL verification (for development purposes only)
  HttpOverrides.global = MyHttpOverrides();

  // Ensure that the Flutter bindings are initialized before using them
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is already logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  bool isLoggedIn = token != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => CareerViewModel()),
      ],
      child: MaterialApp(
        title: 'Portal Alumni',
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: whiteColor,
            elevation: 0,
            iconTheme: IconThemeData(color: blackColor),
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        initialRoute: isLoggedIn ? '/main-page' : '/login-page',
        routes: {
          '/login-page': (context) => LoginPage(),
          '/main-page': (context) => MainPage(),
          '/home-page': (context) => const HomePage(),
          '/profile-page': (context) => const ProfilePage(),
          '/article-page': (context) => const ArticlePage(),
          '/article-detail-page': (context) => const ArticleDetailPage(),
          '/dashboard-page': (context) => const DashboardPage(),
          '/career-page': (context) => const CareerPage(),
          '/career-detail-page': (context) => const CareerDetailPage(),
          '/tracer-study-page': (context) => const TracerStudyPage(),
          '/tracer-biodata-page': (context) => const TracerBiodataPage(),
          '/tracer-wisuda-page': (context) => const TracerWisudaPage(),
          '/tracer-pekerjaan-page': (context) => const TracerPekerjaanPage(),
          '/tracer-studi-lanjut-page': (context) => const TracerStudiLanjutPage(),
          '/tracer-study-selesai-page': (context) => const TracerStudySelesaiPage(),
        },
      ),
    );
  }
}