import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portal_alumni_v1/shared/shared.dart';
import 'package:portal_alumni_v1/ui/pages/pages.dart';
import 'package:portal_alumni_v1/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  // Bypass SSL verification (for development purposes only)
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
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
        initialRoute: '/login-page', // Set initialRoute to your login page
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