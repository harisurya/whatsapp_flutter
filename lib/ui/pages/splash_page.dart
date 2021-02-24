part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    if (isAlreadyLogin) {
      context.read<PageBloc>().add(GoToHomePage());
    } else {
      context.read<PageBloc>().add(GoToBoardingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tealGreen,
        body: Stack(
          children: [
            Container(
              color: tealGreenDark,
            ),
            SafeArea(
                child: Container(
              color: darkBackground,
            )),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Image(
                    image: AssetImage("assets/logo_white.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ));
  }
}
