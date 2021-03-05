part of 'widgets.dart';

class ChatPreviewWidget extends StatelessWidget {
  const ChatPreviewWidget({Key key}) : super(key: key);

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
                child: SpinKitFadingCircle(
                  color: isDarkMode ? Colors.white : tealGreen,
                  size: 70,
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
                      "Justin Timberlake",
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
                Text(
                  "Okay, I ll meet you there buddy",
                  style: whiteTextFont.copyWith(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 13,
                ),
                Divider(
                  color: isDarkMode ? grey : Colors.black.withOpacity(0.2),
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
