

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebapp/controller/managers/home_manager.dart';
import 'package:mywebapp/view/screens/data.dart';
import 'package:mywebapp/view/screens/top-section.dart';
import 'package:mywebapp/view/widgets/flutter_sales_graph.dart';
import 'package:provider/provider.dart';
import '../../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/text_styles.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;

import '../widgets/common_widgets.dart';
import '../widgets/flutter_sales_graph.dart';
import 'main_area.dart';



class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _rotationAnimation;
  // late Animation<double> _fadeAnimation;
  // late Animation<Offset> _slideAnimation;



  bool isMenuOpen = false;

Color color =Colors.black;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      getIt<HomeManager>().setOffsetOfHome(scrollController.offset);

      // setState(() {
      //   _offset = scrollController.offset;
      // });
    });


    Provider.of<HomeManager>(context, listen: false).addListener(() {
      final value = Provider.of<HomeManager>(context, listen: false).homeOffset;
      if (value > 50) {
        // _controller.reverse();
        color = Colors.white;
      }else{
        // _controller.forward();
        color = Colors.black;

      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    // _controller.dispose();
    super.dispose();
  }






ScrollController scrollController = ScrollController();



  // Show dialog when GPS is off

  // Show dialog when permission is denied

  // Show dialog when permission is permanently denied





  @override
  Widget build(BuildContext context) {
    final bool isMobile = DeviceType.isMobile(context);
    final bool isTablet = DeviceType.isTablet(context);
    final bool isDesktop = DeviceType.isDesktop(context);
    final hoveredTransform = Matrix4.identity()..translate(4,-4,0);


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




return Scaffold(
  body: AnimatedContainer(color: color,duration: Duration(milliseconds: 500),


    child: CustomScrollView(controller: scrollController,
      slivers: [
        // AppBar or fixed header
        SliverToBoxAdapter(child: TopOfHome()),

        // Gradient background and main content
        SliverToBoxAdapter(
          child: MainArea(maxWidth: maxWidth, maxHeight: maxHeight,),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(18.0),
          sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 300,
            crossAxisCount: isMobile?2:3, // Single row for horizontal scrolling
            childAspectRatio: 2/1, // Adjust this ratio based on the width and height of your items
            mainAxisSpacing: 10,crossAxisSpacing: 10 // Spacing between items horizontally
              ),
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final e = myProjects[index];
              return MyProjectItem(h1p: h1p, w1p: w1p, pf: e,isSwiped: color==Colors.white);
            },
            childCount: myProjects.length,
              ),
            ),
        )
      ],
    ),
  ),




  // SizedBox(height: 200,
  //   child: ListView(
  //     scrollDirection: Axis.horizontal,
  //     children: myProjects.map((e)=>MyProjectItem(h1p: h1p, w1p: w1p, pf: e)).toList(),),
  // )


                );

              }
            ),
          );


        }
    );
  }




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





Future<void> downloadFile(String filePath, String fileName) async {
  // Load the file as bytes
  final data = await rootBundle.load(filePath);
  final bytes = data.buffer.asUint8List();

  // Create a blob from the file data
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  // Create a temporary anchor element and trigger the download
  final anchor = html.AnchorElement(href: url)
    ..download = fileName
    ..target = 'blank';
  anchor.click();

  // Revoke the object URL to free resources
  html.Url.revokeObjectUrl(url);
}