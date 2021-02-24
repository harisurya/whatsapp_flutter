import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(OnInitialPage onInitialPage) : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage)
      yield OnSplashPage();
    else if (event is GoToBoardingPage) {
      yield OnBoardingPage();
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else {
      yield OnHomePage();
    }
    ;
  }
}
