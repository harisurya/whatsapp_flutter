part of 'widgets.dart';

class ChatPreviewWidget extends StatefulWidget {
  final UserWhatsapp user;
  final String lastMessage;
  final String groupChatId;
  const ChatPreviewWidget(
      {Key key, this.user, this.lastMessage, this.groupChatId})
      : super(key: key);

  @override
  _ChatPreviewWidgetState createState() => _ChatPreviewWidgetState();
}

class _ChatPreviewWidgetState extends State<ChatPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: defaultMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: SpinKitFadingCircle(
                    color: grey,
                    size: 60,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://pyxis.nymag.com/v1/imgs/754/3aa/620e706e15ce66100afe92a5862db0526b-justin-timberlake.rvertical.w1200.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 2 * defaultMargin) - 90,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.user.name,
                      style: whiteTextFont.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    Text("13:51",
                        style: whiteTextFont.copyWith(
                            color: isDarkMode ? Colors.white : Colors.black))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("messages")
                        .doc(widget.groupChatId)
                        .collection(widget.groupChatId)
                        // .orderBy("groupChatId", descending: true)
                        .limit(1)
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                          DocumentSnapshot document;
                          if (snapshot.data.docs.isNotEmpty) {
                             document = snapshot.data.docs[0];
                          }
                          return Text(document != null
                              ? document.data()['content']
                              : "", style: whiteTextFont,);
                        case ConnectionState.waiting:
                          return SizedBox();
                        default:
                          return SizedBox();
                      }
                    }),
                SizedBox(
                  height: 13,
                ),
                Divider(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.2),
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
