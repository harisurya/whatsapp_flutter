part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnHomePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnBoardingPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSettingPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnContactPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnEditProfilePage extends PageState {
  final UserWhatsapp user;

  OnEditProfilePage(this.user);
  @override
  List<Object> get props => [];
}


class OnChatPage extends PageState {
   final UserWhatsapp user;

  OnChatPage(this.user);
  @override
  List<Object> get props => [];
}