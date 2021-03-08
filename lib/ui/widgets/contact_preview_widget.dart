part of 'widgets.dart';

class ContactPreviewWidget extends StatelessWidget {
  final UserWhatsapp user;

  const ContactPreviewWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageBloc>().add(GoToChatPage(user));
      },
      child: Container(
        color: Colors.transparent,
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
                    image:
                        user.profilePicture == "" || user.profilePicture == null
                            ? AssetImage(user.gender == "male"
                                ? "assets/avatar_male.png"
                                : "assets/avatar_female.png")
                            : NetworkImage(user.profilePicture),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width:
                  (MediaQuery.of(context).size.width - 2 * defaultMargin) - 90,
              height: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: whiteTextFont.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Online",
                    style: greyTextFont.copyWith(fontSize: 14, color: tosca),
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
      ),
    );
  }
}
