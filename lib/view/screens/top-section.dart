

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebapp/controller/managers/home_manager.dart';
import 'package:mywebapp/view/screens/data.dart';
import 'package:mywebapp/view/widgets/flutter_sales_graph.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/text_styles.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;

import '../widgets/common_widgets.dart';
import '../widgets/flutter_sales_graph.dart';



class TopOfHome extends StatefulWidget {

  @override
  State<TopOfHome> createState() => _TopOfHomeState();
}

class _TopOfHomeState extends State<TopOfHome>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Define rotation animation for the menu/close button
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define fade animation for the buttons
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define slide animation for the buttons
    _slideAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleMenu() {
    setState(() {
      if (isMenuOpen) {
        _controller.reverse(); // Hide the menu
      } else {
        _controller.forward(); // Show the menu
      }
      isMenuOpen = !isMenuOpen;
    });
  }





  // Show dialog when GPS is off

  // Show dialog when permission is denied

  // Show dialog when permission is permanently denied





  @override
  Widget build(BuildContext context) {
    final bool isMobile = DeviceType.isMobile(context);
    final bool isTablet = DeviceType.isTablet(context);
    final bool isDesktop = DeviceType.isDesktop(context);


    var smWidgets = SmallWidgets();


    return LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;





                  return  Container(
                    height: 100,
                    width: maxWidth,
                    color: Colors.black,child:
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: w1p*4),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [ smWidgets.menuText("Home"),
                                  smWidgets.menuText("My works"),
                                  smWidgets.menuText("Skills"),
                                  smWidgets.menuText("Contact"),]
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: toggleMenu,
                            child: AnimatedBuilder(
                                animation: _rotationAnimation,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: _rotationAnimation.value * 3.14, // Rotate half-circle
                                    child: Container(
                                      width: 50,
                                      height: 50,

                                      alignment: Alignment.center,
                                      child: Icon(
                                        isMenuOpen ? Icons.close : Icons.menu,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),);}))
                      ],
                    ),
                  ),
                  );




                    // SizedBox(height: 200,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: myProjects.map((e)=>MyProjectItem(h1p: h1p, w1p: w1p, pf: e)).toList(),),
                    // )







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

class MyProjectItem  extends StatelessWidget {
  double w1p;
  double h1p;
  MyProjectModel pf;
  bool isSwiped;
  MyProjectItem({
    required this.h1p,
    required this.w1p,
    required this.pf,
    required this.isSwiped,
  });

  @override
  Widget build(BuildContext context) {

    Future<void> _launchUrl(url) async {
      final Uri _url = Uri.parse(url);

      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    String name = '${pf.name}';
    String image = pf.image ?? "";
    String subtitle = pf.description ?? "";



    return  Container(
      margin: EdgeInsets.only(top: h1p,bottom: h1p,
      ),
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow(offset: Offset(0,0),
          // color: !isSwiped?Colors.white.withOpacity(0.1):Colors.black.withOpacity(0.2),spreadRadius: 2,blurRadius: 2)],
          borderRadius: BorderRadius.circular(8),color: isSwiped?Colors.white:Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(100),
                    child: Container(height: 45,color: Colors.transparent,
                      width: 45,
                      child:
                              Image.asset(image)
                    )
                ),

                horizontalSpace(8),
                Text(name,style:t400_16.copyWith(color: isSwiped?clr2D2D2D:null),),

                // Spacer(),
                // Text(date,style: TextStyles.textStyle78b,)
              ],
            ),
          ),
          verticalSpace(2),
          SizedBox(height: 150,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [





                    Text(subtitle,style:t400_14.copyWith(color: isSwiped?clr2D2D2D:null,fontFamily: "ChakraPetch"),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,),
                  ],
                ),
              )),
          Container(decoration: BoxDecoration(color: Color(0xffE9E9E9)),

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: w1p*5,vertical: 12),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("See",style:t400_10.copyWith(color: clr2D2D2D)),
                  
                  Row(children:pf.availableAt!.map((e)=>GestureDetector(onTap: (){
                    _launchUrl(e.url);

                  },child: SizedBox(height:25,width:25,child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset("assets/images/${e.platform??""}.png"),
                  )))).toList())
                  // SizedBox(height:18,child: SvgPicture.asset("assets/images/forward-arrow.svg",,))
                  // Icon(Icons.navigate_next_outlined)
                ],
              ),
            ),)

        ],),);
  }
}

class MyProjectModel {
  String? name;
  String? description;
  String? image;
  List<AvailablePlatform>? availableAt;

  MyProjectModel({this.name, this.description, this.image,this.availableAt});

  MyProjectModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    if (json['available'] != null) {
      availableAt = <AvailablePlatform>[];
      json['available'].forEach((v) {
        availableAt!.add(new AvailablePlatform.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}



class AvailablePlatform {
  String? platform;
  String? url;

  AvailablePlatform({this.platform, this.url});

  AvailablePlatform.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    url = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['img'] = this.url;
    return data;
  }
}