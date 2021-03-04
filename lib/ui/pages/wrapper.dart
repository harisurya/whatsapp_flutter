part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (!(prevPageEvent is GoToSplashPage)) {
      prevPageEvent = GoToSplashPage();
      context.watch<PageBloc>().add(GoToSplashPage());
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
      } else {
        return HomePage();
      }
    });
  }
}
