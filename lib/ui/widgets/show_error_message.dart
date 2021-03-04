part of 'widgets.dart';

Widget showErrorMessage(BuildContext context, {String message}) {
  return Flushbar(
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: tealGreen,
    message: message,
  )..show(context);
}
