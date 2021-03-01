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
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "http://t3.gstatic.com/images?q=tbn:ANd9GcQzxoPDNWC7vxR69YKHno3HR4f2rdpTwcXmA6PVBZHUxF5_ku83LolOsgYYQ9Wo"),
                  fit: BoxFit.cover,
                )),
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
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("13:51", style: whiteTextFont)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Okay, I ll meet you there buddy",
                  style: whiteTextFont.copyWith(fontSize: 14),
                ),
                SizedBox(height: 28,),
                Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
