import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData DarkTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme:  AppBarTheme(
    backgroundColor: const Color(0xFF292A2F),
    elevation: 0.0,
    titleTextStyle: GoogleFonts.shadowsIntoLight().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF00a8a8),
      letterSpacing: 2,
    ),
    centerTitle: true,
    backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF292A2F),
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(color: Color(0xFF00a8a8), size: 30),
  ),
  scaffoldBackgroundColor: const Color(0xFF292A2F),
  drawerTheme: const DrawerThemeData(
    elevation: 1,
    backgroundColor: Color(0xFFa8a890),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(80),
        bottomRight: Radius.circular(200),
      ),
    ),

  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
  ),
);
