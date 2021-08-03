// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/Shared/constant.dart';
import 'package:sql/cubit/bloc.dart';
import 'package:sql/cubit/whole_Cubit.dart';

import 'package:sql/layout/home_layout.dart';
import 'package:sql/network/dio_helper.dart';

import 'Shared/pref.dart';
import 'cubit/whole_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  APPCubit()..getBusiness();
  DioHelper.init();
  await Pref.init();
  bool isDark = Pref.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => APPCubit()..getBusiness()..getSports()..getScience()..getHealth()..getTec(),
      ),
        BlocProvider(
          create: (BuildContext context) =>
              WholeCubit()..changeAppMode(fromShared: isDark),
        ),

      ],
      child: BlocConsumer<WholeCubit, WholeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.black26,
                  elevation: 20,
                  type: BottomNavigationBarType.fixed),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  backgroundColor: Colors.black26,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey,
                    statusBarBrightness: Brightness.light,
                  ),
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  iconTheme: IconThemeData(color: Colors.white)),
              scaffoldBackgroundColor: Colors.black26,
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    backgroundColor: Colors.white,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarBrightness: Brightness.dark,
                    ),
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    iconTheme: IconThemeData(color: Colors.black)),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    //   backgroundColor: Colors.black26,
                    elevation: 20,
                    type: BottomNavigationBarType.fixed)),
            debugShowCheckedModeBanner: false,
            themeMode: WholeCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
