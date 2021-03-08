part of 'widgets.dart';

class CallPreviewHistoryWidget extends StatelessWidget {
  final String name;
  final String time;

  const CallPreviewHistoryWidget({Key key, this.name, this.time})
      : super(key: key);
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
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/avatar_male.png"),
                        fit: BoxFit.cover,
                      ))),
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
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Captain_Marvel_trailer_at_the_National_Air_and_Space_Museum_4_%28cropped%29.jpg/440px-Captain_Marvel_trailer_at_the_National_Air_and_Space_Museum_4_%28cropped%29.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 2 * defaultMargin) - 90,
            height: 82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: whiteTextFont.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    Icon(Icons.call, color: tosca)
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  time,
                  style: whiteTextFont.copyWith(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
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
