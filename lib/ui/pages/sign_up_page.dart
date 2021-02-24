part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(color: tealGreenDark),
      SafeArea(
          child: Container(
        color: tealGreenDark,
      )),
      Align(
        alignment: Alignment.topLeft,
      )
    ]));
  }
}
