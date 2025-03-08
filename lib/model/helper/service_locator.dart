


import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/managers/home_manager.dart';

final getIt = GetIt.instance;

Future <void> setupServiceLocator() async{
  getIt.registerSingleton<HomeManager>(HomeManager());




}


