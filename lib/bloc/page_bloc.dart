import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_flutter/models/models.dart';

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
    } else if (event is GoToSettingPage) {
      yield OnSettingPage();
    }else if (event is GoToContactPage) {
      yield OnContactPage();
    }else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.user);
    }else if (event is GoToChatPage) {
      yield OnChatPage(event.user);
    }else {
      yield OnHomePage();
    }
    ;
  }
}
