// @dart=2.9



import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/Shared/pref.dart';
import 'package:sql/cubit/whole_states.dart';

class WholeCubit extends Cubit <WholeStates>{
  WholeCubit( ) : super(WholeInitialState());

static WholeCubit get(context)=> BlocProvider.of(context);

  bool isDark = true;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      emit(ChangeAppMode1());
      isDark = fromShared;
      print(isDark);
    } else {
      print(isDark);
      isDark = !isDark;
      Pref.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode2());
      });
    }
  }
}