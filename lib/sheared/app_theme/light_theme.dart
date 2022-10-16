import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData LightTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme:  AppBarTheme(
    backgroundColor: Colors.white24,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.shadowsIntoLight().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF2C3639),
      letterSpacing: 2,
    ),
    centerTitle: true,
    backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white24,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(color: const Color(0xFFA1C298), size: 30),
  ),
  scaffoldBackgroundColor: const Color(0xFFC6EBC5),
  drawerTheme: const DrawerThemeData(
    elevation: 1,
    backgroundColor: Color(0xFFFBF2CF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(80),
        bottomRight: Radius.circular(200),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
  ),
);
