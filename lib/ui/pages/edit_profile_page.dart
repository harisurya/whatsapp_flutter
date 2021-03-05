part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final UserWhatsapp user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: tealGreenDark,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 104,
                    margin: EdgeInsets.only(top: 30),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 90,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (imageFileToUpload != null)
                                        ? FileImage(imageFileToUpload)
                                        : (widget.user.profilePicture.isEmpty ||
                                                widget.user.profilePicture ==
                                                    null)
                                            ? AssetImage(
                                                "assets/avatar_male.png")
                                            : NetworkImage(
                                                widget.user.profilePicture),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (imageFileToUpload == null) {
                                imageFileToUpload = await getImage();
                              } else {
                                imageFileToUpload = null;
                              }

                              setState(() {});
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (imageFileToUpload == null)
                                          ? AssetImage(
                                              "assets/btn_add_photo.png")
                                          : AssetImage(
                                              "assets/btn_del_photo.png"))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
