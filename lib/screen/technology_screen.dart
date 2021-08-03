// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/Shared/components.dart';
import 'package:sql/cubit/bloc.dart';
import 'package:sql/cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APPCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = APPCubit.get(context).tec;
        return article(list: list,context: context);
      },
    );
  }
}
