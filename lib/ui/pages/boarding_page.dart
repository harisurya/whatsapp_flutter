part of 'pages.dart';

class BoardingPage extends StatefulWidget {
  BoardingPage({Key key}) : super(key: key);

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: darkBackground,
          ),
          SafeArea(
              child: Container(
            color: darkBackground,
          )),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     margin: EdgeInsets.symmetric( vertical: 50),
          //     child: Text(
          //       "Welcome to WhatsApp",
          //       style: whiteTextFont.copyWith(
          //           fontSize: 28, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              height: MediaQuery.of(context).size.height - 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome to WhatsApp",
                    style: whiteTextFont.copyWith(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Image(
                      width: 250,
                      height: 250,
                      image: AssetImage("assets/boarding_logo.jpeg"),
                      fit: BoxFit.cover),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Read our ",
                              style: greyTextFont,
                            ),
                            Text(
                              "Privacy Policy.",
                              style: blueTextFont,
                            ),
                            Text(
                              " Tap 'Agree and Continue' to",
                              style: greyTextFont,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Accept the ",
                              style: greyTextFont,
                            ),
                            Text(
                              "Terms of Services.",
                              style: blueTextFont,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: tosca,
                              child: Text(
                                "AGREE AND CONTINUE",
                                style: blackTextFont.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                context.read<PageBloc>().add(GoToSignUpPage());
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "from",
                    style: greyTextFont,
                  ),
                  Text(
                    "FLUTTER",
                    style: whiteTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
