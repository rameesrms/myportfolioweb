

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mywebapp/controller/managers/home_manager.dart';
import 'package:provider/provider.dart';
import '../../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/text_styles.dart';

import '../widgets/common_widgets.dart';
import '../widgets/flutter_sales_graph.dart';



class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  void initState() {
   // getIt<CloseSaleManager>().loadHomeScreen();
   // getIt<CloseSaleManager>().loadPromotions();
   // _getCurrentLocation();
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  // Show dialog when GPS is off

  // Show dialog when permission is denied

  // Show dialog when permission is permanently denied

  bool isHovered = false;




  @override
  Widget build(BuildContext context) {
final hoveredTransform = Matrix4.identity()..translate(4,-4,0);
final transform = isHovered?hoveredTransform:Matrix4.identity();


    var smWidgets = SmallWidgets();

    // DashBoardResponseModel? dash = Provider.of<HomeManager>(context).dashBoard;
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>(); // Create a key

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.light,
        // statusBarColor: Colors.primaryblue,
        statusBarIconBrightness: Brightness.dark// Status bar color
    ));

    return LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;

          loader() {
            return
              Container(decoration: BoxDecoration(shape: BoxShape.rectangle),
                  height: 32,
                  width: 32,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,));
          }

          return SafeArea(
            child: Consumer<HomeManager>(
              builder: (context,mgr,child) {




return Scaffold(body: Column(children: [
  Container(height: 100,width:maxWidth,color: Colors.black,
  child: Row(children: [


    Text("RMS"),
    Spacer(),

    smWidgets.menuText("Home"),
    smWidgets.menuText("My works"),
    smWidgets.menuText("Skills"),
    smWidgets.menuText("Contact"),



  ],),
  ),
  Expanded(child: Container(width: maxWidth,
  decoration: BoxDecoration(gradient: LinearGradient(colors: [
    Color(0xff000000 ),
    Color(0xff333333  ),

  ])),

    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: w1p*6),
      child: Row(children: [

        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Im Ramees\na Flutter Developer",style: t400_32,),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [

                  Container(

                    width: 150,height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  MouseRegion(
                      onEnter:(event) => onEntered(true),
                      onExit: (event) => onEntered(false),
                    child: AnimatedContainer(

                        width: 150,height: 40,
                        duration: Duration(milliseconds: 200),
                        transform: transform,

                        decoration: BoxDecoration(border: Border.all(color: Colors.white),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Resume",style: t400_18,),
                          Icon(Icons.download,color: Colors.white,)
                        ],
                      )
                    )),
                  ),


                ],
              ),
            ),



          ],
        )
      ],),
    ),

  ))
],)




                );

              }
            ),
          );


        }
    );
  }


  onEntered(bool isHovered)=>setState(() {
    this.isHovered = isHovered;
  });

}
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       final tween = Tween(begin: begin, end: end);
//       final offsetAnimation = animation.drive(tween);
//
//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//     },
//   );
// }

