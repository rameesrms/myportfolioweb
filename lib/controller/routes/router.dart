
import 'package:flutter/material.dart';




class Routers{


  static Route<dynamic> generateRoute
      (

      RouteSettings settings
      ) {
    switch (settings.name) {
        //
        // case RouteNames.home:
        // return MaterialPageRoute(builder: (_) => HomeScreen());

   // case "Join": return MaterialPageRoute(builder: (context) => const JoinScreen());
   //  case "Intro": return MaterialPageRoute(builder: (context) => const IntroScreen());


// case '/coursePage':
// return MaterialPageRoute(builder: (_) => CoursePage());
// case '/enquiryScreen':
//   SingleCourse data = settings.arguments as SingleCourse;
//
//   return MaterialPageRoute(
//       settings: settings,
//       builder: (_) => EnquiryScreen(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }}







