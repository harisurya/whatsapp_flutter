part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String selectedGender = "male";
  bool isSigningUp = false;
  bool isPasswordValid = false;
  bool isEmailValid = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToBoardingPage());
        return;
      },
      child: Scaffold(
          body: Stack(children: [
        Container(color: tealGreenDark),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToBoardingPage());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
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
                      controller: nameController,
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
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email Address",
                          hintText: "Please type your password"),
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
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
                      controller: passController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Password",
                          hintText: "Please type your password"),
                      obscureText: true,
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
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
                      controller: passConfirmController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Password Confirmation",
                          hintText: "Please type your password confirmation"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 50),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Colors.white,
                          size: 45,
                        )
                      : Center(
                          child: Container(
                            width: 250,
                            height: 50,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: RaisedButton(
                                color: (isPasswordValid & isEmailValid)
                                    ? tealGreen
                                    : grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Signup",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 20)),
                                onPressed: isPasswordValid & isEmailValid
                                    ? () async {
                                        if (nameController.text
                                            .trim()
                                            .isEmpty) {
                                          showErrorMessage(context,
                                              message: "Name can't be empty");
                                        } else if (emailController.text
                                            .trim()
                                            .isEmpty) {
                                          showErrorMessage(context,
                                              message: "Email can't be empty");
                                        } else if (passController.text
                                            .trim()
                                            .isEmpty) {
                                          showErrorMessage(context,
                                              message:
                                                  "Password can't be empty");
                                        } else if (passConfirmController.text
                                            .trim()
                                            .isEmpty) {
                                          showErrorMessage(context,
                                              message:
                                                  "Password Confirmation can't be empty");
                                        } else if (passController.text.trim() !=
                                            passConfirmController.text.trim()) {
                                          showErrorMessage(context,
                                              message:
                                                  "Password and Password Confirmation doesnt match");
                                        } else {
                                          setState(() {
                                            isSigningUp = true;
                                          });

                                          SignInSignUpResult result =
                                              await Authservices.signUp(
                                                  email: emailController.text,
                                                  name: nameController.text,
                                                  gender: selectedGender,
                                                  password:
                                                      passController.text);

                                          if (result.message != null) {
                                            setState(() {
                                              isSigningUp = false;
                                            });
                                            showErrorMessage(context,
                                                message: result.message);
                                          } else {
                                            context
                                                .read<PageBloc>()
                                                .add(GoToHomePage());
                                          }
                                        }
                                      }
                                    : () {}),
                          ),
                        ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?  ",
                            style: greyTextFont),
                        GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToSignInPage());
                          },
                          child: Text("Sign In",
                              style: whiteTextFont.copyWith(
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ,SizedBox(height: 20),
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }
}
