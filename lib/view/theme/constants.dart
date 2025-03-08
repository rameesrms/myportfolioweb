import 'package:flutter/material.dart';


class Colours {
  static const primaryRed = const Color(0xffED1C24);
  static const primaryblue = const Color(0xff2E3192);
  static const lightYellow = const Color(0xffFFF4F4);

  static const grad1 = const Color(0xff4D51C7);
  static const lightBlu = const Color(0xffF2F2F2);


}


Widget petLoader = Center(child: CircularProgressIndicator(backgroundColor:  Color(0xffF8F9FA),color: Color(0xffFFD166)));


Padding pad({double? horizontal, double? vertical, required Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0, vertical: vertical ?? 0),
    child: child,
  );
}

double containerRadius = 24;

Widget  subLoader = Padding(
padding: const EdgeInsets.all(8.0),
child: Center(child: CircularProgressIndicator(strokeWidth: 5,color: Colours.primaryblue.withOpacity(0.5))));









class StringConstants {
  static const String token = "token";
  static const String loginedUserType = "loginedUserType";
  static const String baseUrl = "https://elora.demosoftfruit.com/api/";//live new
  static const String imgBaseUrl = "https://elora.demosoftfruit.com";//live new


  static const String coordSelectedStoreId = "coordSelectedStoreId";//live new
  static const String coordSelectedstoreName = "coordSelectedstoreName";//live new




}

var boxShadow1 = BoxShadow(color: Colors.black12,offset: Offset(0,4),blurRadius: 5,spreadRadius: 4);
var boxShadow2 = BoxShadow(color: Colors.black12,offset: Offset(1,1),blurRadius: 2,spreadRadius: 2);
var boxShadowSelected = BoxShadow(color: Colours.primaryRed,offset: Offset(0,0),blurRadius: 4.3,spreadRadius: 0);
var boxShadowUnSelected = BoxShadow(color: Color(0xffC3C3C3).withOpacity(0.3),offset: Offset(0,0),blurRadius: 6.3,spreadRadius: 0);
var boxShadowUnSelected2 = BoxShadow(color: Color(0xffC3C3C3).withOpacity(0.3),offset: Offset(0,0),blurRadius: 4.3,spreadRadius: 0);
var boxShadow3 = BoxShadow(color: Color(0xffC3C3C3),offset: Offset(0,0),blurRadius: 6.3,spreadRadius: 0);


var linearGrad = LinearGradient(colors: [
  Color(0xff4D51C7),
  Color(0xff2E3192),
], begin: Alignment.bottomCenter, end: Alignment.topCenter);




// EasyDayProps dayDropsStyle({required double height}) {
//   return EasyDayProps(dayStructure: DayStructure.monthDayNumDayStr,
//     height: height,activeDayNumStyle: TextStyles.textStyle,inactiveDayNumStyle:TextStyles.textStyle3,
//     inactiveDayStrStyle:TextStyles.textStyle3,
//     activeDayStrStyle: TextStyles.textStyle3,inactiveMothStrStyle:TextStyles.textStyle3,
//     activeMothStrStyle: TextStyles.textStyle3,
//     todayMonthStrStyle: TextStyles.textStyle3,todayStrStyle:TextStyles.textStyle3,
//   );
// }

class Borders {
  // static var outlineInputBorder1 = OutlineInputBorder(borderRadius: BorderRadius.circular(4),borderSide: BorderSide(color: Colours.hash,width: 0.8));
//
}

