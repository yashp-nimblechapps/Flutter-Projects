import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_architecture/utils/app_colors.dart';

void commonToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: blackColor,
    textColor: whiteColor,
    fontSize: 16.0,
  );
}
