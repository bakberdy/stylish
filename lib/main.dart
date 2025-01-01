import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/basket_screen/view_model/basket_view_model.dart';
import 'package:stylish_ecommerce_app/src/screens/loading_screen/loading_screen.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/setting_view_model.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/wishlist_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WishlistViewModel>(
            create: (_) => WishlistViewModel()),
        ChangeNotifierProvider(
          create: (_) => BasketViewModel(),
        ),
        ChangeNotifierProvider(
            create: (_)=>SettingViewModel(),)
      ], child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish',
      theme: ThemeData(
        cardColor: const Color(0xff626262),
        primaryColor: const Color(0xffF83758),
        canvasColor: const Color(0xffA8A8A9),
        textTheme: AppTextStyles.getTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFCF3F6)),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}

class AppTextStyles {
  static TextTheme getTextTheme() {
    return TextTheme(
      titleLarge: GoogleFonts.montserrat(
          fontSize: 36, color: Colors.black, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.montserrat(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w800),
      bodySmall:
          GoogleFonts.montserrat(fontSize: 14, color: const Color(0xffA8A8A9)),
      labelLarge: GoogleFonts.montserrat(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      labelMedium: GoogleFonts.montserrat(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
      labelSmall: GoogleFonts.montserrat(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
    );
  }
}
