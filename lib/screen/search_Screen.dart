// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/Shared/components.dart';
import 'package:sql/cubit/bloc.dart';
import 'package:sql/cubit/states.dart';
import 'package:sql/cubit/whole_Cubit.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APPCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = APPCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  onChanged: (value) {
                    APPCubit.get(context).getSearch(value);
                  },
                  style: TextStyle(
                    color: WholeCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'Search can not be empty';
                    else
                      return null;
                  },
                ),
              ),
              Expanded(child: article(list: list, context: context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
