part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController pageController;
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: selectedIndex);
  }

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
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          child: Text(
                            "WhatsApp",
                            style: greyTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSettingPage());
                              },
                              child: Icon(Icons.more_vert,
                                  color: Colors.white, size: 25),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: grey,
                        size: 25,
                      ),
                      displayBarHeader()
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  height: MediaQuery.of(context).size.height - 130,
                  color: isDarkMode ? darkBackground : Colors.white,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children: [
                      displayChatHistory(),
                      displayStatusHistory(),
                      displayCallHistory(),
                    ],
                  ),
                )
              ],
            ),
          )),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(right: defaultMargin, bottom: 30),
          child: RaisedButton(
              elevation: 2.0,
              padding: EdgeInsets.all(20.0),
              color: tosca,
              shape: CircleBorder(),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {}),
        ),
      )
    ]));
  }

  Widget displayBarHeader() {
    List<String> menuList = ['CHAT', 'STATUS', 'CALLS'];
    List<Widget> widgets = [];

    for (int i = 0; i < menuList.length; i++) {
      String menu = menuList[i];
      bool isSelected = selectedIndex == i ? true : false;
      widgets.add(InkWell(
        splashColor: Colors.white,
        onTap: () {
          setState(() {
            selectedIndex = i;
            pageController.animateToPage(selectedIndex,
                curve: Curves.easeInOut, duration: Duration(milliseconds: 400));
          });
        },
        child: Container(
          width:
              ((MediaQuery.of(context).size.width - 2 * defaultMargin) - 50) /
                  3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 37,
                child: Center(
                  child: Text(
                    menu,
                    style: greyTextFont.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? tosca : grey),
                  ),
                ),
              ),
              Container(
                height: 3,
                color: isSelected ? tosca : Colors.transparent,
              )
            ],
          ),
        ),
      ));
    }

    return Container(
      width: (MediaQuery.of(context).size.width - 2 * defaultMargin) - 40,
      height: 40,
      child: Row(
        children: widgets,
      ),
    );
  }

  Widget displayChatHistory() {
    List<Widget> widgets = [];

    for (var i = 0; i < 20; i++) {
      widgets.add(ChatPreviewWidget());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget displayStatusHistory() {
    List<Widget> widgets = [];

    widgets.add(StatusPreviewWidget(
      title: "My Status",
      desc: "Tap to add status update",
    ));
    widgets.add(Container(
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, bottom: 10),
      child: Text("Recent updates",
          style: whiteTextFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDarkMode ? Colors.white : Colors.black)),
    ));

    for (int i = 0; i < 20; i++) {
      widgets.add(StatusPreviewWidget(
        title: "John Doe $i",
        desc: "Today, 13:" + (i < 10 ? "0" : "") + "$i",
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  Widget displayCallHistory() {
    List<Widget> widgets = [];

    for (int i = 0; i < 20; i++) {
      widgets.add(CallPreviewHistoryWidget(
          name: "John Doe $i",
          time: "Today, 13:" + (i < 10 ? "0" : "") + "$i"));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
