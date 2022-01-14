import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static Color pColor() {
    return Colors.black54;
  }
  static Widget connectOrNotWidget(bool isConnected , Widget widget_is_connected) {
    return isConnected ?
           widget_is_connected :
           const Image(
              image: AssetImage("assets/lost_connection_image.png"),
              width: 100,
              height: 100
           );
  }
}