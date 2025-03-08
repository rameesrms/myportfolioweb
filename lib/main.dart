
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mywebapp/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'controller/managers/home_manager.dart';
import 'controller/routes/router.dart';
import 'model/helper/service_locator.dart';



final navigatorKey = GlobalKey<NavigatorState>();



void main() async {


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Background color of the status bar
    statusBarIconBrightness: Brightness.dark, // Black icons
    statusBarBrightness: Brightness.light, // For iOS status bar
  ));
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // // Initialize Firebase notifications
  // await FirebaseApi().initNotification();

  // Setup service locator for dependency injection
  await setupServiceLocator();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await FirebaseApi().initNotification();

  runApp(MyApp());
}



// Main application widget
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyRouteObserver myRouteObserver = MyRouteObserver();

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => getIt<HomeManager>()),
      ],
      child: Consumer(
        builder: (context, provider, child) {
          return MaterialApp(onGenerateRoute:Routers.generateRoute,
            debugShowCheckedModeBanner: false,
            navigatorObservers: [myRouteObserver],



            // Set the locale based on shared preferences or fallback to 'en'


            // Define named routes

            // Initial screen of the app
            home: HomeScreen(),
            // home: SuccessScreen(SalesCloseResponseModel()),

            title: "Who am I",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

// Observer to track navigation events
class MyRouteObserver extends NavigatorObserver {
  String? currentRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    currentRoute = route.settings.name;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    currentRoute = previousRoute?.settings.name;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    currentRoute = newRoute?.settings.name;
  }
}

