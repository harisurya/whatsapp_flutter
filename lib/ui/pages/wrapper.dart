part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (firebaseAuth.currentUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.watch<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (!(prevPageEvent is GoToHomePage)) {
        context.watch<UserBloc>().add(LoadUser(firebaseAuth.currentUser.uid));

        prevPageEvent = GoToHomePage();
        context.watch<PageBloc>().add(GoToHomePage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnSplashPage) {
        return SplashPage();
      } else if (pageState is OnBoardingPage) {
        return BoardingPage();
      } else if (pageState is OnSignUpPage) {
        return SignUpPage();
      } else if (pageState is OnSignInPage) {
        return SignInPage();
      } else if (pageState is OnSettingPage) {
        return SettingPage();
      } else if (pageState is OnContactPage) {
        return ContactPage();
      } else if (pageState is OnEditProfilePage) {
        return EditProfilePage(pageState.user);
      } else {
        return HomePage();
      }
    });
  }
}
