part of 'pages.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToHomePage());
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              color: tealGreenDark,
            ),
            SafeArea(
                child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              color: tealGreenDark,
              // child:
            )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                color: isDarkMode ? darkBackground : Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      color: tealGreenDark,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToHomePage());
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Select contact",
                                  style: whiteTextFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    FutureBuilder(
                      future: UserServices.getUsers(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          List<UserWhatsapp> users = snapshot.data;

                          return Container(
                            height: MediaQuery.of(context).size.height - 100,
                            child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (_, index) {
                                  return ContactPreviewWidget(
                                    user: users[index],
                                  );
                                }),
                          );
                        } else {
                          return Container(
                            height: 200,
                            child: Center(
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
