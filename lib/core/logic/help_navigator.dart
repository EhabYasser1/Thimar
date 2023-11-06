import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigatorTo(Widget page) {
  Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
    builder: (context) => page,
  ));
}
enum MessageType{success,fail,waring}

void showMessage(String message,{MessageType type =MessageType.fail} ){
if(message.isNotEmpty){

  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor:type==MessageType.fail?Colors.red: type==MessageType.waring?Colors.yellow:Theme.of(navigatorKey.currentContext!).primaryColor,


      )
  );
}


}
