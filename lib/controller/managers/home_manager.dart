


import 'package:flutter/material.dart';






class HomeManager extends ChangeNotifier {

  double homeOffset = 0.0;


  setOffsetOfHome(offset){
    homeOffset = offset;
    notifyListeners();
  }



}