part of 'pages.dart';

class ChatPage extends StatefulWidget {
  final UserWhatsapp user;

  const ChatPage({Key key, this.user}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String groupChatId;
  String peerId;
  String peerAvatar;
  String id;

  List<QueryDocumentSnapshot> listMessage = new List.from([]);
  int _limit = 20;
  int _limitIncrement = 20;
  SharedPreferences prefs;

  File imageFile;
  bool isLoading;
  bool isShowSticker;
  String imageUrl;

  final TextEditingController chatTextController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);

    groupChatId = '';

    isLoading = false;
    isShowSticker = false;
    imageUrl = '';

    readLocal();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  readLocal() async {
    id = currentUserID;
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'chattingWith': peerId});

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToHomePage());
        return;
      },
      child: Scaffold(
        backgroundColor: darkBackground,
        body: Stack(
          children: [
            SafeArea(child: Container(color: darkBackground)),
            Container(
              color: tealGreenDark,
              child: Container(
                height: 70,
                color: tealGreenDark,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(GoToHomePage());
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              widget.user.gender == "male"
                                                  ? "assets/avatar_male.png"
                                                  : "assets/avatar_female.png"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                widget.user.profilePicture == null ||
                                        widget.user.profilePicture.isEmpty
                                    ? SizedBox()
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://pyxis.nymag.com/v1/imgs/754/3aa/620e706e15ce66100afe92a5862db0526b-justin-timberlake.rvertical.w1200.jpg"),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width -
                                      2 * defaultMargin) -
                                  90 -
                                  76,
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.user.name,
                                    style: whiteTextFont.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Online",
                                      style: whiteTextFont.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              margin: EdgeInsets.only(top: 100),
              color: isDarkMode ? darkBackground : grey,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 200,
                      child: buildListMessage(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: 30,
                          left: defaultMargin,
                          right: defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 55,
                              width: (MediaQuery.of(context).size.width -
                                      2 * defaultMargin) -
                                  60,
                              decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? darkBackground.withOpacity(0.7)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.image_search_rounded,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 175,
                                    child: TextField(
                                        controller: chatTextController,
                                        onSubmitted: (value) {
                                          onSendMessage(
                                              chatTextController.text, 0);
                                        },
                                        cursorColor: Colors.white,
                                        style: isDarkMode
                                            ? whiteTextFont.copyWith(
                                                fontSize: 16)
                                            : blackTextFont.copyWith(
                                                fontSize: 16),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 11,
                                                right: 15),
                                            hintText: "Type a message",
                                            hintStyle: isDarkMode
                                                ? whiteTextFont.copyWith(
                                                    fontSize: 16)
                                                : blackTextFont.copyWith(
                                                    fontSize: 16))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: tealGreen,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.send,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                onSendMessage(chatTextController.text, 0);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      chatTextController.clear();

      var documentReference = FirebaseFirestore.instance
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(
          documentReference,
          {
            'idFrom': id,
            'idTo': peerId,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
          },
        );
      });
      listScrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send',
          backgroundColor: Colors.black,
          textColor: Colors.red);
    }
  }

  Widget buildListMessage() {
    return Flexible(
      child: groupChatId == ''
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .doc(groupChatId)
                  .collection(groupChatId)
                  .orderBy('timestamp', descending: true)
                  .limit(_limit)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)));
                } else {
                  listMessage.addAll(snapshot.data.docs);
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) =>
                        buildItem(index, snapshot.data.docs[index]),
                    itemCount: snapshot.data.docs.length,
                    reverse: true,
                    controller: listScrollController,
                  );
                }
              },
            ),
    );
  }

  Widget buildItem(int index, DocumentSnapshot document) {
    if (document.data()['idFrom'] == id) {
      // Right (my message)
      return Row(
        children: <Widget>[
          document.data()['type'] == 0
              // Text
              ? Container(
                  child: Text(
                    document.data()['content'],
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(
                      bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                      right: 10.0),
                )
              : SizedBox()
          // document.data()['type'] == 1
          //     // Image
          //     ? Container(
          //         child: FlatButton(
          //           child: Material(
          //             child: CachedNetworkImage(
          //               placeholder: (context, url) => Container(
          //                 child: CircularProgressIndicator(
          //                   valueColor: AlwaysStoppedAnimation<Color>(themeColor),
          //                 ),
          //                 width: 200.0,
          //                 height: 200.0,
          //                 padding: EdgeInsets.all(70.0),
          //                 decoration: BoxDecoration(
          //                   color: greyColor2,
          //                   borderRadius: BorderRadius.all(
          //                     Radius.circular(8.0),
          //                   ),
          //                 ),
          //               ),
          //               errorWidget: (context, url, error) => Material(
          //                 child: Image.asset(
          //                   'images/img_not_available.jpeg',
          //                   width: 200.0,
          //                   height: 200.0,
          //                   fit: BoxFit.cover,
          //                 ),
          //                 borderRadius: BorderRadius.all(
          //                   Radius.circular(8.0),
          //                 ),
          //                 clipBehavior: Clip.hardEdge,
          //               ),
          //               imageUrl: document.data()['content'],
          //               width: 200.0,
          //               height: 200.0,
          //               fit: BoxFit.cover,
          //             ),
          //             borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //             clipBehavior: Clip.hardEdge,
          //           ),
          //           onPressed: () {
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder: (context) => FullPhoto(url: document.data()['content'])));
          //           },
          //           padding: EdgeInsets.all(0),
          //         ),
          //         margin: EdgeInsets.only(bottom: isLastMessageRight(index) ? 20.0 : 10.0, right: 10.0),
          //       )
          //     // Sticker
          //     : Container(
          //         child: Image.asset(
          //           'images/${document.data()['content']}.gif',
          //           width: 100.0,
          //           height: 100.0,
          //           fit: BoxFit.cover,
          //         ),
          //         margin: EdgeInsets.only(bottom: isLastMessageRight(index) ? 20.0 : 10.0, right: 10.0),
          //       ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      // Left (peer message)
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    document.data()['content'],
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            ),

            // Time
            isLastMessageLeft(index)
                ? Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(document.data()['timestamp']))),
                      style: TextStyle(
                          color: grey,
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(left: 50.0, top: 5.0, bottom: 5.0),
                  )
                : Container()
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1].data()['idFrom'] == id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1].data()['idFrom'] != id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }
}