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
        '/': (context) =>  LoginPage(),

        '/login-page': (context) => const LoginPage(),
        '/main-page': (context) => MainPage(),
        '/home-page' : (context) => const HomePage(),
        '/profile-page' : (context) => const ProfilePage(),
        '/article-page' : (context) => const ArticlePage(),
        '/article-detail-page' : (context) => const ArticleDetailPage(),
        '/dashboard-page' : (context) => const DashboardPage(),
        '/career-page' : (context) => const CareerPage(),
        '/career-detail-page' : (context) => const CareerDetailPage(),

        '/tracer-study-page' : (context) => const TracerStudyPage(),
        '/tracer-biodata-page' : (context) => const TracerBiodataPage(),
        '/tracer-wisuda-page' : (context) => const TracerWisudaPage(),
        '/tracer-pekerjaan-page' : (context) => const TracerPekerjaanPage(),
        '/tracer-studi-lanjut-page' : (context) => const TracerStudiLanjutPage(),
        '/tracer-study-selesai-page' : (context) => const TracerStudySelesaiPage(),

      },
    );
  }
}