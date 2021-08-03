// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/Shared/components.dart';
import 'package:sql/cubit/bloc.dart';
import 'package:sql/cubit/whole_Cubit.dart';
import 'package:sql/screen/search_Screen.dart';
import '../cubit/states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<APPCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          APPCubit cubit = APPCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                    navigatetTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      WholeCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined))
              ],
              title: Text('${cubit.titles[cubit.currentIndex]}'),
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 16,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'Science'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.health_and_safety), label: 'Health'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.android), label: 'technology')
              ],
            ),
          );
        });
  }
}
