part of 'pages.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
              Container(
                color: tealGreenDark,
              ),
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                UserWhatsapp user = (userState as UserLoaded).user;

                return Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.only(top: 30),
                    color: isDarkMode ? darkBackground : Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    context
                                        .read<PageBloc>()
                                        .add(GoToHomePage());
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
                                      "Settings",
                                      style: whiteTextFont.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(height: 50),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: SpinKitFadingCircle(
                                color: isDarkMode ? Colors.white : tealGreen,
                                size: 120,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: user.profilePicture == "" ||
                                                user.profilePicture == null
                                            ? AssetImage(user.gender == "male"
                                                ? "assets/avatar_male.png"
                                                : "assets/avatar_female.png")
                                            : NetworkImage(user.profilePicture),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          user.name,
                          style: whiteTextFont.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          user.email,
                          style: greyTextFont.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? grey : tosca),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<PageBloc>()
                                .add(GoToEditProfilePage(user));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              children: [
                                Icon(Icons.edit,
                                    size: 30,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Edit Profile",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black)),
                              ],
                            ),
                          ),
                        ),
                        divider(),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            children: [
                              Icon(Icons.people,
                                  size: 30,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Contacts",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                        divider(),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      isDarkMode
                                          ? Icons.brightness_2
                                          : Icons.brightness_4,
                                      size: 30,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Dark Mode",
                                      style: whiteTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black)),
                                ],
                              ),
                              Switch(
                                  value: isDarkMode,
                                  activeColor: tosca,
                                  activeTrackColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      isDarkMode = value;
                                    });
                                  })
                            ],
                          ),
                        ),
                        divider(),
                      ],
                    ),
                  ),
                );
              }),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    context.read<UserBloc>().add(SignOut());
                    context.read<PageBloc>().add(GoToSplashPage());
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    color: isDarkMode ? darkBackground : Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: 70),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app,
                            size: 30,
                            color: isDarkMode ? Colors.white : Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign Out",
                          style: whiteTextFont.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: defaultMargin),
      child: Divider(
        color: isDarkMode ? grey : Colors.black.withOpacity(0.2),
        thickness: 1,
      ),
    );
  }
}
