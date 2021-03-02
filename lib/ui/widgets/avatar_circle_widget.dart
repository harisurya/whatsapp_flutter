part of 'widgets.dart';

class AvatarCircleWidget extends StatelessWidget {
  final String avatarUrl;
  final bool isSelected;
  final Function onTap;

  const AvatarCircleWidget(
      {Key key, this.avatarUrl, this.isSelected, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: isSelected ? tosca : Colors.white, width: 4),
            image: DecorationImage(
                image: AssetImage(avatarUrl), fit: BoxFit.cover)),
        child: isSelected
            ? SizedBox()
            : Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.2)
                        ])),
              ),
      ),
    );
  }
}
