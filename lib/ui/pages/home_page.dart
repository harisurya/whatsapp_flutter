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
            margin: EdgeInsets.only(top: 25),
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
                          // color: Colors.pink,
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
                            Icon(Icons.more_vert,
                                color: Colors.white, size: 25),
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
                Container(
                  height: MediaQuery.of(context).size.height - 105,
                  color: darkBackground,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children: [
                      Text("CHATS", style: whiteTextFont),
                      Text("status", style: whiteTextFont),
                      Text("calls", style: whiteTextFont)
                    ],
                  ),
                )
              ],
            ),
          ))
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
}
