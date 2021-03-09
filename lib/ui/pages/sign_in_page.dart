part of 'pages.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isPasswordValid = false;
  bool isEmailValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSignUpPage());
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
                      context.read<PageBloc>().add(GoToSignUpPage());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
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
                      child: Text("Hello Again!\nWelcome\nback",
                          style: whiteTextFont.copyWith(
                              fontSize: 36, fontWeight: FontWeight.w300))),
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
                  SizedBox(height: 50),
                  (isSigningIn)
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
                                child: Text("Sign In",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 20)),
                                onPressed: isPasswordValid & isEmailValid
                                    ? () async {
                                        if (emailController.text
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
                                        } else {
                                          setState(() {
                                            isSigningIn = true;
                                          });

                                          SignInSignUpResult result =
                                              await Authservices.signIn(
                                                  email: emailController.text,
                                                  password:
                                                      passController.text);

                                          if (result.message != null) {
                                            setState(() {
                                              isSigningIn = false;
                                            });
                                            showErrorMessage(context,
                                                message: result.message);
                                          } else {
                                            context
                                                .read<UserBloc>()
                                                .add(LoadUser(result.user.id));
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
                        Text("Forgot Your Password  ? ", style: greyTextFont),
                        GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToSignUpPage());
                          },
                          child: Text("Signup",
                              style: whiteTextFont.copyWith(
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }
}
