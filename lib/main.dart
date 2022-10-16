import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/layout.dart';
import 'package:news/sheared/app_theme/dark_theme.dart';
import 'package:news/sheared/app_theme/light_theme.dart';
import 'package:news/sheared/cubit/news_cubit.dart';
import 'package:news/sheared/cubit/news_state.dart';
import 'package:news/sheared/network/remote/dio_helper.dart';
import 'package:news/sheared/network/local/chach_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.init();
  DioHelper.init();
  bool? isDark = cacheHelper.getData(key: 'DarkMade');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..ChangeMode(isDark: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme,
        darkTheme: DarkTheme,
        themeMode: NewsCubit.get(context).DarkMade? ThemeMode.dark : ThemeMode.light,
        home: Layout(),
      );
  },
),
    );
  }
}
