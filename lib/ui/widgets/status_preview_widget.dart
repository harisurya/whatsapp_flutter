part of 'widgets.dart';

class StatusPreviewWidget extends StatelessWidget {
  final String title;
  final String desc;

  const StatusPreviewWidget({Key key, this.title, this.desc}) : super(key: key);

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
                            "https://vz.cnwimg.com/thumbc-300x300/wp-content/uploads/2010/06/Elon-Musk.jpg"),
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
            height: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: whiteTextFont.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  desc,
                  style: whiteTextFont.copyWith(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(height: 10),
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
