// @dart=2.9

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/network/dio_helper.dart';
import 'package:sql/screen/health_screen.dart';
import 'package:sql/screen/sports_screen.dart';
import 'package:sql/screen/business_screen.dart';
import 'package:sql/screen/science_screen.dart';
import 'package:sql/cubit/states.dart';
import 'package:sql/screen/technology_screen.dart';

class APPCubit extends Cubit<AppStates> {
  APPCubit() : super(InitialStates());

  static APPCubit get(context) => BlocProvider.of(context);
  List<Widget> screen = [Business(), Sports(), Science(), HealthScreen(),TechnologyScreen()];
  int currentIndex = 0;

  List<String> titles = ['Business', 'Sports', 'science', 'Health','Technology'];

  void changeIndex(int index) {
    currentIndex = index;
    getScience();
    getSports();

    emit(BottomNavBarChangeState());
  }

  List<dynamic> search;

  void getSearch(String value) {
    emit(NewsGetSearchLoading());

    DioHelper.getData(url: 'v2/everything', query: {
      "q": "$value",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchError(error));
    });
  }

  List<dynamic> business;

  void getBusiness() {
    emit(NewsGetBusinessLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "business",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports;

  void getSports() {
    emit(NewsGetSportsLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "sports",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science;

  void getScience() {
    emit(NewsGetScienceLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "science",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error));
    });
  }
  List<dynamic> health;

  void getHealth() {
    emit(NewsGetHealthLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "health",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      health = value.data['articles'];
      emit(NewsGetHealthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error));
    });
  }
  List<dynamic> tec;

  void getTec() {
    emit(NewsGetTecSuccessState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "technology",
      "apikey": "de3bde9acb3e42c6b1b108a1bcae4f12",
    }).then((value) {
      tec = value.data['articles'];
      emit(NewsGetTecSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTecErrorState(error));
    });
  }
}
