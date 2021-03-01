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
          Container(
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
          SizedBox(
            width: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 2 * defaultMargin) - 90,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
              children: [
                Text(
                  title,
                  style: whiteTextFont.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  desc,
                  style: whiteTextFont.copyWith(fontSize: 14),
                ),
                 SizedBox(height: 28),
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
