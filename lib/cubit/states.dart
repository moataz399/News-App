// @dart=2.9


abstract class AppStates {}

class InitialStates extends AppStates {}

class BottomNavBarChangeState extends AppStates {}

class NewsGetBusinessSuccessState extends AppStates {}

class NewsGetBusinessErrorState extends AppStates {
  final String erorr;

  NewsGetBusinessErrorState(this.erorr);
}

class NewsGetBusinessLoading extends AppStates {}

class AppChangeMode extends AppStates {}

class NewsGetSportsSuccessState extends AppStates {}

class NewsGetSportsErrorState extends AppStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoading extends AppStates {}

class NewsGetScienceSuccessState extends AppStates {}




class NewsGetScienceErrorState extends AppStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoading extends AppStates {}

class NewsGetSearchLoading extends AppStates {}

class NewsGetSearchSuccess extends AppStates {}
class NewsGetSearchError extends AppStates {final String error;

NewsGetSearchError(this.error);}


class NewsGetHealthSuccessState extends AppStates {}




class NewsGetHealthErrorState extends AppStates {
  final String error;

  NewsGetHealthErrorState(this.error);
}

class NewsGetHealthLoading extends AppStates {}


class NewsGetTecSuccessState extends AppStates {}




class NewsGetTecErrorState extends AppStates {
  final String error;

  NewsGetTecErrorState(this.error);
}

class NewsGetTecLoading extends AppStates {}
