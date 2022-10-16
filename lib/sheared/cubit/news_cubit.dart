import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business.dart';
import 'package:news/modules/entertainment/entertainment.dart';
import 'package:news/modules/general/general.dart';
import 'package:news/modules/health/health.dart';
import 'package:news/modules/sciences/science.dart';
import 'package:news/modules/sports/sport.dart';
import 'package:news/modules/technology/technology.dart';
import 'package:news/sheared/cubit/news_state.dart';
import 'package:news/sheared/network/remote/dio_helper.dart';
import 'package:news/sheared/network/local/chach_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<String> topicDrawer = [
    "Business",
    "Entertainment",
    "Sport",
    "Science",
    "Technology",
    "Health",
    "General",
  ];

  Widget bodyScreen = BusinessScreen();

  void changeScreen(index) {
    switch (index) {
      case 0:
        bodyScreen = BusinessScreen();
        getBusiness();
        break;
      case 1:
        bodyScreen = EntertainmentScreen();
        getEntertainment();
        break;
      case 2:
        bodyScreen = SportScreen();
        getSports();
        break;
      case 3:
        bodyScreen = ScienceScreen();
        getSciences();
        break;
      case 4:
        bodyScreen = TechnologyScreen();
        getTechnology();
        break;
      case 5:
        bodyScreen = HealthScreen();
        getHealth();
        break;
      case 6:
        bodyScreen = GeneralScreen();
        getGeneral();
        break;
    }
    emit(ChangeScreenState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      business = value.data['articles'];
      emit(BusinessSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(BusinessErrorState());
    });
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(EntertainmentLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      entertainment = value.data['articles'];
      emit(EntertainmentSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(EntertainmentErrorState());
    });
  }

  List<dynamic> general = [];

  void getGeneral() {
    emit(GeneralLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'general',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      general = value.data['articles'];
      emit(GeneralSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(GeneralErrorState());
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(HealthLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      health = value.data['articles'];
      emit(HealthSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(HealthErrorState());
    });
  }

  List<dynamic> science = [];

  void getSciences() {
    emit(SciencesLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      science = value.data['articles'];
      emit(SciencesSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SciencesErrorState());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      sports = value.data['articles'];
      emit(SportsSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SportsErrorState());
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(TechnologyLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      technology = value.data['articles'];
      emit(TechnologySuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(TechnologyErrorState());
    });
  }

  List<dynamic> search = [];

  void getSearch({required String searchText}) {
    emit(SearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': searchText,
      'apiKey': '4560b738f4644d7292fcff517e4899c1',
    })
        .then((value) {
      search = value.data['articles'];
      emit(SearchSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }


  bool DarkMade = true;
  IconData DarkLightMode = Icons.brightness_4_outlined;

  void ChangeMode({bool? isDark}) {
    if (isDark != null) {
      DarkMade = isDark;
      emit(ChangeModeApp());
    } else {
      DarkMade = !DarkMade;
      cacheHelper.putData(key: "DarkMade", value: DarkMade).then((value) {
        emit(ChangeModeApp());
      });
    }
    if (!DarkMade) {
      DarkLightMode = Icons.dark_mode_outlined;
      emit(IconChangeMode());
    } else {
      DarkLightMode = Icons.brightness_4_outlined;
      emit(IconChangeMode());
    }
  }
}
