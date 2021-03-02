part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String selectedGender = "male";
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: tealGreen,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: tealGreenDark,
                size: 32,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Text("Hello!\nSignup to\nget started",
                    style: whiteTextFont.copyWith(
                        fontSize: 36, fontWeight: FontWeight.w300))),
            SizedBox(height: 20),
            Row(
              children: [
                AvatarCircleWidget(
                  avatarUrl: "assets/avatar_male.png",
                  isSelected: selectedGender == "male" ? true : false,
                  onTap: () {
                    setState(() {
                      selectedGender = "male";
                    });
                  },
                ),
                AvatarCircleWidget(
                  avatarUrl: "assets/avatar_female.png",
                  isSelected: selectedGender == "female" ? true : false,
                  onTap: () {
                    setState(() {
                      selectedGender = "female";
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Name",
                    hintText: "Please type your name"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email Address",
                    hintText: "Please type your password"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password Confirmation",
                    hintText: "Please type your password confirmation"),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: RaisedButton(
                    color: tealGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text("Signup",
                        style: whiteTextFont.copyWith(fontSize: 20)),
                    onPressed: () {}),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? ", style: greyTextFont),
                  Text("Sign In",
                      style:
                          whiteTextFont.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }
}
