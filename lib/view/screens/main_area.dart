import 'package:flutter/material.dart';
import 'package:mywebapp/controller/managers/home_manager.dart';
import 'package:provider/provider.dart';

import '../theme/text_styles.dart';
import '../widgets/flutter_sales_graph.dart';

class MainArea extends StatefulWidget {
  double maxWidth;
  double maxHeight;

  MainArea({required this.maxWidth, required this.maxHeight, });

  @override
  State<MainArea> createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea> with  SingleTickerProviderStateMixin {
late AnimationController _controller;
late Animation<double> _rotationAnimation;
late Animation<double> _fadeAnimation;
late Animation<Color?> _colorAnimation;
late Animation<Offset> _slideAnimation;
Color color = Colors.black;
bool isHovered = false;
late double titleWidth ;



@override
void initState() {
  titleWidth = widget.maxWidth*0.3;
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

  _colorAnimation = ColorTween(
    end: Colors.white,
    begin: Colors.black,
  ).animate(_controller);

  // Define slide animation for the buttons
  _slideAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
      .animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut,),
  );


  Provider.of<HomeManager>(context, listen: false).addListener(() {
    final value = Provider.of<HomeManager>(context, listen: false).homeOffset;
    if (value > 50) {
      _controller.reverse();
      color = Colors.white;
      titleWidth = widget.maxWidth*0.35;
    }else{
      _controller.forward();

      color = Colors.black;
      titleWidth = widget.maxWidth*0.3;

    }
  });


}




@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

// void toggleMenu() {
//   setState(() {
//     if (widget.isSwipedDown) {
//       _controller.reverse(); // Hide the menu
//     } else {
//       _controller.forward(); // Show the menu
//     }
//     widget.isSwipedDown = !widget.isSwipedDown;
//   });
// }

  @override
  Widget build(BuildContext context) {

     // double homeOffset = Provider.of<HomeManager>(context).homeOffset;


  final bool isMobile = DeviceType.isMobile(context);
    final bool isTablet = DeviceType.isTablet(context);
    final bool isDesktop = DeviceType.isDesktop(context);
    final hoveredTransform = Matrix4.identity()..translate(4,-4,0);
    final transform = isHovered?hoveredTransform:Matrix4.identity();

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isMobile?widget.maxHeight/2:widget.maxHeight-100,
      width: widget.maxWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff333333),
          color,

        ],begin: Alignment.topLeft,end: Alignment.bottomLeft),
      ),
      child: Stack(
        children: [

          // FadeTransition(
          //     opacity: _fadeAnimation,
          //     child: SlideTransition(
          //         position: _slideAnimation,child: Image.asset("assets/images/img.png"))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.maxWidth*0.06,),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width:titleWidth,
                      child: FittedBox(
                          child: InkWell(
                              onTap: (){
                                // downloadFile("assets/ramees-resume.pdf", "ramees-resume");

                              },
                              child: AnimatedBuilder(
                                  animation: _colorAnimation,
                                  builder: (context, child) {
                                  return Text("Im Ramees\na Flutter Developer", style: t400_32.copyWith(fontFamily: "Lalita",
                                  color: _colorAnimation.value
                                  ));
                                }
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          GestureDetector(onTap: (){
                            // downloadFile("assets/ramees-resume.pdf", "ramees-resume");
                          },
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          MouseRegion(
                            onEnter: (event) => onEntered(true),
                            onExit: (event) => onEntered(false),
                            child: AnimatedContainer(
                              width: 120,
                              height: 40,
                              duration: Duration(milliseconds: 200),
                              transform: transform,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(child: Text("Resume", style: t400_18)),
                                    Icon(Icons.download, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                      width: isMobile?widget.maxWidth/2:widget.maxHeight/2,height:isMobile?widget.maxWidth/2:widget.maxHeight/2,
                      child: Image.asset("assets/images/my-photo.png",fit: BoxFit.cover,)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  onEntered(bool isHovered)=>setState(() {
    this.isHovered = isHovered;
  });
}
