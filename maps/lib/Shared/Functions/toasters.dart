import 'package:fluttertoast/fluttertoast.dart';
import 'package:maps/Constants/constants.dart';

void showToastMessage(String msg, {dynamic color, dynamic textColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color ?? K_whiteColor,
    textColor: textColor ?? K_whiteColor,
    fontSize: K_fontSizeL - 5,
  );
}
